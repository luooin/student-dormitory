package com.hzvtc.myproject.vo;

import lombok.Data;
import lombok.experimental.Accessors;


@Data
//这也是Lombok的一个注解，用于改变setter方法的默认行为。
// 当chain属性设置为true时，setter方法会返回this，从而允许链式调用。
@Accessors(chain = true)
public class Result<T> {
    private Integer statusCode;
    private String msg;

    private T data;

    public static <T> Result<T> ok(String msg) {
        Result<T> result = new Result<>();
        result.statusCode = 200;
        result.msg = msg;
        return result;
    }

    public static <T> Result<T> ok() {
        Result<T> result = new Result<>();
        result.statusCode = 200;
        result.msg = "请求成功";
        return result;
    }

    public static <T> Result<T> fail(Integer statusCode, String msg) {
        Result<T> result = new Result<>();
        result.statusCode = statusCode;
        result.msg = msg;
        return result;
    }

    public Result<T> add(T data) {
        this.data = data;
        return this;
    }
}
