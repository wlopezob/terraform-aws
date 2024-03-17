package com.wlopezob.uxcomisaria.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "http-client.app-database-v1")
@Getter
@Setter
public class ApplicationProperties {
    private String url;
}
