package com.hzvtc.myproject.dto;

import lombok.Data;

/**
 * 用于分页
 *

 */
//这段代码定义了一个Java泛型类ListQuery，该类用于表示分页查询的条件。
//Lombok库提供了一个@Data注解，它可以自动为类生成getter、setter、equals、hashCode和toString方法，从而简化代码。
@Data
//定义了一个公共泛型类ListQuery，其中的T是一个类型参数，表示该类可以包含任何类型的实体。
public class ListQuery<T> {
    /**
     * 查询条件
     */
//    entity是一个泛型成员变量，它代表查询条件，可以是任何类型的对象。
        private T entity;

    /**
     * 页
     */
//    page是一个整数类型的成员变量，表示要查询的页码。默认值为1，即默认查询第一页。
    private Integer page = 1;

    /**
     * 每页行数
     */
//    rows是一个整数类型的成员变量，表示每页显示的行数。默认值为10，即默认每页显示10行数据。
    private Integer rows = 10;
}
