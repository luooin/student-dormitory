package com.hzvtc.myproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.Date;

//这是一个Lombok注解，它会自动生成该类的getter、setter、equals、hashCode和toString方法。
// 这样，你不需要手动编写这些方法，代码更加简洁。
@Data
public class BackLate {
    private Long id;
//    这是一个JSR 380（Bean Validation）的注解，用于确保studentId字段在验证时不为null。
    @NotNull
    private Long studentId;

    private Student student;

    private String reason;
//    这是一个Jackson的注解，用于在序列化和反序列化backDate字段时，按照指定的格式yyyy-MM-dd HH:mm:ss进行。
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    定义了一个私有的LocalDateTime类型成员变量backDate，用于存储学生晚归的日期和时间。
    private LocalDateTime backDate;
}
