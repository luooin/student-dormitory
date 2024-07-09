package com.hzvtc.myproject.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 用于密码修改
 *
 */
//@Data注解：Lombok库提供的注解，它会自动为类生成getter、setter、equals、hashCode和toString方法。
@Data
//implements Serializable：表示这个类实现了Serializable接口，因此其对象可以被序列化。
public class Password implements Serializable {
//    serialVersionUID是一个静态常量，用于在反序列化过程中验证序列化对象的版本一致性。
    private static final long serialVersionUID = -1771036907310685922L;

//    注解表示这个字段在序列化到JSON时是可以写入的，但在从JSON反序列化回对象时是不可读的。
//    这通常用于安全性考虑，以防止敏感信息（如旧密码）被不当地暴露。
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
//    字符串类型的成员变量，用于存储旧密码。
    private String oldPassword;
//    密码修改相关的字符串字段，只允许写入不允许读取。
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String current1;
//    密码修改相关的另一个字符串字段，也是只写属性。
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String current2;
}
