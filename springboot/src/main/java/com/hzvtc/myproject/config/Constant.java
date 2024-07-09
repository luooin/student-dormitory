package com.hzvtc.myproject.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;

// Constant类中的属性将会绑定到配置文件
// （如application.properties或application.yml）中前缀为constant的属性上。
@ConfigurationProperties(prefix = "constant")
public class Constant {
//公共的静态常量，用于存储字符串"_ut"。它可能表示一个HTTP请求头中的令牌（token）。
    public final static String HEADER_TOKEN = "_ut";
//    公共的静态常量，用于存储默认的密码
    public final static String DEFAULT_PASSWORD = "123456";
//    静态变量，用于存储上传路径。
//    它的值将通过setUploadPath方法从配置文件中注入。
    public static String UPLOAD_PATH;

//注解用于注入配置文件中的constant.upload-path属性的值到setUploadPath方法的参数中。
    @Value("${constant.upload-path}")
    public void setUploadPath(String uploadPath) {
        UPLOAD_PATH = uploadPath;
    }
}
