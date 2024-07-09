package com.hzvtc.myproject.exception;

//这个HttpException类是一个自定义的运行时异常，用于处理与HTTP请求或响应相关的错误情况。
// 它包含了一个HTTP状态码和一个异常消息。通过继承RuntimeException，这个异常可以在不需要显式捕获的情况下抛出。
// 而使用Lombok的@Getter注解，该类会自动生成code字段的getter方法。
// 这样，当抛出这个异常时，可以方便地获取HTTP状态码和异常信息。

import lombok.Data;
import lombok.Getter;
//@Getter注解被用于为类的属性自动生成getter方法。
@Getter
//公共类HttpException，它继承自RuntimeException。
public class HttpException extends RuntimeException{
//    静态常量，用于在反序列化过程中验证序列化对象的版本一致性。
    private static final long serialVersionUID = 6771315879176421659L;
//    私有的、不可变的整型成员变量code，用于存储HTTP状态码。
    private final Integer code;

//    它首先调用父类RuntimeException的构造函数，传入message作为异常信息。
//    然后，它将传入的code赋值给类的成员变量code。
    public HttpException(Integer code, String message) {
        super(message);
        this.code = code;
    }
}
