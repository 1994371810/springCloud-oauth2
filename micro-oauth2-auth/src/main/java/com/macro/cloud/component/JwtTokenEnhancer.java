package com.macro.cloud.component;

import cn.hutool.core.collection.CollUtil;
import com.macro.cloud.bean.SysUser;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * JWT内容增强器
 * Created by macro on 2020/6/19.
 */
@Component
public class JwtTokenEnhancer implements TokenEnhancer {
    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
        AuthUserDetails securityUser = (AuthUserDetails) authentication.getPrincipal();

        Map<String, Object> info = new HashMap();

        SysUser sysUser = securityUser.getSysUser();

        //把用户ID设置到JWT中
        info.put("id", sysUser.getId());

        //放入用户角色
        if( CollUtil.isNotEmpty( sysUser.getRoles() ) ){
            List<String> roles = sysUser.getRoles().stream()
                    .map(role -> role.getName())
                    .collect(Collectors.toList());
            info.put("role",roles);
        }

        //放入用户权限
        if( CollUtil.isNotEmpty( sysUser.getMenus() ) ){
            List<String> roles = sysUser.getMenus().stream()
                    .map(role -> role.getAuthorities())
                    .collect(Collectors.toList());
            info.put("permission",roles);
        }

        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(info);

        return accessToken;
    }
}
