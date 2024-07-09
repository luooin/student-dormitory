package com.hzvtc.myproject.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.util.List;

//@Data注解是Lombok提供的，它会自动为类生成getter、setter、equals、hashCode和toString方法。
@Data
//注解是Lombok的，它使得setter方法返回this，从而支持链式调用。
//例如，building.setName("Main").setParentId(1L);
@Accessors(chain = true)
public class Building {
//    该建筑的id号
    private Long id;
//    @NotBlank注解是JSR 380（Bean Validation）的一部分
//    用于确保name字段在验证时不是空白的（即不是null且不是只包含空白字符）。
    @NotBlank
    private String name;
//    该建筑的父建筑ID
    private Long parentId;
//    建筑内学生的数量
    private Integer studentNum;
//    建筑内的房间数量
    private Integer roomNum;
//    children是一个列表，存储该建筑的子建筑。这个列表是递归的
//    意味着每个Building对象都可以包含多个Building对象作为其子建筑。
    private List<Building> children;
 }
