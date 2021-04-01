package com.macro.cloud.service;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.macro.cloud.bean.SysUser;
import com.macro.cloud.component.AuthUserDetails;
import com.macro.cloud.config.SecurityConfigProperties;
import com.macro.cloud.constant.MessageConstant;
import com.macro.cloud.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * @Author gjw
 * @Date 2021/3/16 10:07
 **/
@Service
@EnableConfigurationProperties(SecurityConfigProperties.class)
public class AuthUserDetailService implements UserDetailsService {

    @Resource
    private SysUserMapper sysUserMapper;

    @Resource
    private SecurityConfigProperties securityConfigProperties;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private PasswordEncoder passwordEncoder;


    private final String tokenGroup = "token::";

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        if( StrUtil.isBlank( username) ) {
            return null;
        }

        //从缓存中获取
        String tokenKey = getTokenRedisKey(username);
        ValueOperations valueOp = redisTemplate.opsForValue();
        SysUser sysUser = (SysUser) valueOp.get( tokenKey );

        //如果缓存为空则从数据库获取 如果数据库也为空抛出异常
        if(sysUser == null && (sysUser = sysUserMapper.selectUserByUsername(username)) ==null ){
            throw new UsernameNotFoundException(MessageConstant.USERNAME_PASSWORD_ERROR);
        }

        AuthUserDetails details = new AuthUserDetails(sysUser);

        //放入缓存
        valueOp.set(tokenKey,sysUser,securityConfigProperties.getExpiration(), TimeUnit.MILLISECONDS);

        //判断用户状态
        if (!details.isEnabled()) {
            throw new DisabledException(MessageConstant.ACCOUNT_DISABLED);
        } else if (!details.isAccountNonLocked()) {
            throw new LockedException(MessageConstant.ACCOUNT_LOCKED);
        } else if (!details.isAccountNonExpired()) {
            throw new AccountExpiredException(MessageConstant.ACCOUNT_EXPIRED);
        } else if (!details.isCredentialsNonExpired()) {
            throw new CredentialsExpiredException(MessageConstant.CREDENTIALS_EXPIRED);
        }

        return details;
    }




    /**
     * 注册用户
     * */
    public boolean regist(String username,String password){

        if( StrUtil.isAllNotBlank(username,password) ){

            //查询是否已被注册
            LambdaQueryWrapper<SysUser> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(SysUser::getName,username);
            SysUser sysUser = sysUserMapper.selectOne(wrapper);

            if( sysUser != null ){
                throw new OAuth2Exception("该用户已被注册");
            }

            //添加用户
            SysUser newUser = new SysUser();
            newUser.setName(username);
            newUser.setPassword( passwordEncoder.encode( password ) );
            int insert = sysUserMapper.insert(newUser);

            return insert > 0;
        }

        return false;
    }




    /**获取token的缓存key*/
    public String getTokenRedisKey(String username){
        return  tokenGroup + username;
    }


    /*刷新用户权限缓存*/
    public void flushUserCache(String username){
        redisTemplate.delete( getTokenRedisKey(username) );
        loadUserByUsername(username);
    }

}
