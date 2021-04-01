package com.macro.cloud.authorization;

import com.macro.cloud.constant.RedisConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authorization.AuthorizationDecision;
import org.springframework.security.authorization.ReactiveAuthorizationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.server.authorization.AuthorizationContext;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.net.URI;

/**
 * 鉴权管理器，用于判断是否有资源的访问权限
 * Created by macro on 2020/6/19.
 */
@Component
public class AuthorizationManager implements ReactiveAuthorizationManager<AuthorizationContext> {
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    @Override
    public Mono<AuthorizationDecision> check(Mono<Authentication> mono, AuthorizationContext authorizationContext) {

        //从Redis中获取当前路径需要的权限
        URI uri = authorizationContext.getExchange().getRequest().getURI();
        HashOperations<String, String, String> hashOp = redisTemplate.opsForHash();

        String authoritie = hashOp.get(RedisConstant.RESOURCE_ROLES_MAP, uri.getPath());

        //认证通过且角色匹配的用户可访问当前路径
        return mono
                .filter(Authentication::isAuthenticated)
                .flatMapIterable(Authentication::getAuthorities)
                .map(GrantedAuthority::getAuthority)
                .any( o ->{ //这里返回true表示能够访问
                    //如果当前访问接口不需要权限或者用户有该权限，放行
                    return authoritie==null || authoritie.equals(o);
                })
                .map(AuthorizationDecision::new)
                .defaultIfEmpty(new AuthorizationDecision(true));
    }

}
