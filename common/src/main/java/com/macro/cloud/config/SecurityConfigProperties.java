package com.macro.cloud.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;

/**
 * @Author gjw
 * @Date 2021/3/16 9:28
 **/

@ConfigurationProperties(prefix = "security.config")
@Data
public class SecurityConfigProperties {

    /**
     * 加密密钥
     * */
    private String secret;

    /**令牌过期时间(毫秒) 默认 1小时 */
    private Long expiration = 3600000L;

    /**允许访问的路径*/
    private List<String> allowPath;

}
