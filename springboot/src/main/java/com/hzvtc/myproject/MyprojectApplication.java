package com.hzvtc.myproject;

import com.hzvtc.myproject.config.Constant;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;

//复合注解，它包括了
// @SpringBootConfiguration
// @EnableAutoConfiguration
// @ComponentScan
// 这意味着当前类是一个Spring Boot应用的配置类，它启用了自动配置，并且会自动扫描当前包及其子包下的组件。
@SpringBootApplication

//告诉Spring Boot去扫描com.hzvtc.myproject.dao包下所有的MyBatis映射器接口，
// 并自动创建它们的实现。
@MapperScan("com.hzvtc.myproject.dao")
//启用对@ConfigurationProperties注解的支持，并将Constant类中的属性绑定到配置文件中的属性上。
//这通常用于将配置文件中的值注入到Java Bean中。
@EnableConfigurationProperties({Constant.class})
//这个注解用于启用Spring的定时任务功能。
//如果应用中有使用@Scheduled注解的方法，那么这个注解是必需的。
@EnableScheduling
public class MyprojectApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext application
                = SpringApplication.run(MyprojectApplication.class, args);
        Environment env = application.getEnvironment();
        String port = env.getProperty("server.port");
        System.out.println("Local:http://localhost:" + port);
    }

}
