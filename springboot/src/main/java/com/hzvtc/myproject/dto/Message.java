package com.hzvtc.myproject.dto;

import lombok.Data;
import lombok.experimental.Accessors;

//这段代码定义了一个Java实体类Message，用于表示一条消息。
//@Data注解：Lombok库提供的注解，它会自动为类生成getter、setter、equals、hashCode和toString方法。
@Data
//注解：Lombok库提供的注解，它使得setter方法返回this，从而支持链式调用。
//        例如，message.setType(1).setTitle("Hello").setFrom("UserA");
@Accessors(chain = true)
public class Message {
//    type是一个整型变量，可能用于表示消息的类型或类别。
    private int type;
//    title是一个字符串类型的变量，可能用于表示消息的标题或主题。
    private String title;
//    from是一个字符串类型的变量，用于表示消息的发送者。
    private String from;
//    to是一个字符串类型的变量，用于表示消息的接收者。
    private String to;
//    messageBody是一个字符串类型的变量，用于表示消息的正文或内容。
    private String messageBody;
}
