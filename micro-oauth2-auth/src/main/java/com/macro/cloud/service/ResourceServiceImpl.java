package com.macro.cloud.service;

import cn.hutool.core.collection.CollUtil;
import com.macro.cloud.bean.SysMenu;
import com.macro.cloud.constant.RedisConstant;
import com.macro.cloud.mapper.SysMenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 将菜单需要的权限放入缓存
 * Created by macro on 2020/6/19.
 */
@Service
public class ResourceServiceImpl {


    @Autowired
    private RedisTemplate redisTemplate;

    @Resource
    private SysMenuMapper sysMenuMapper;

    @PostConstruct
    public void initData() {
        List<SysMenu> sysMenus = sysMenuMapper.selectAll();

        if (CollUtil.isNotEmpty( sysMenus )) {
            HashOperations hashOp = redisTemplate.opsForHash();

            Map<String,String> resource = new HashMap(sysMenus.size());

            sysMenus.forEach( menu -> resource.put(menu.getPath(),menu.getAuthorities()));

            hashOp.putAll(RedisConstant.RESOURCE_ROLES_MAP,resource);
        }
    }
}
