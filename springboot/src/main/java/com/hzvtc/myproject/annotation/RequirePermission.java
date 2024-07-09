package com.hzvtc.myproject.annotation;

import com.hzvtc.myproject.utils.Match;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


//名为RequirePermission的Java自定义注解。注解通常用于为代码添加元数据，

// 这个注解表示RequirePermission只能被用于方法上。ElementType.METHOD是ElementType枚举的一个值，表示方法。
@Target(ElementType.METHOD)

//这个注解表示RequirePermission注解的生命周期是运行时。
//这个注解在运行时可以被读取，通常用于那些需要在运行时通过反射获取注解信息的场景。
//RetentionPolicy.RUNTIME是RetentionPolicy枚举的一个值，表示注解信息会保留在运行时。
@Retention(RetentionPolicy.RUNTIME)


public @interface RequirePermission {

    /**
     * 权限标识
     * @return
     */
//当使用这个注解时，需要为permissions元素提供一个或多个字符串值，这些值可能代表不同的权限标识。
    String[] permissions();

    /**
     * 匹配方式
     * @return
     */
    //    这是一个名为matchType的元素，其类型为Match（一个枚举类型）。
//    它有一个默认值Match.HAS_ANY。
//    Match枚举类可能是用来表示权限匹配方式的，比如是否要求用户具有所有列出的权限，还是只需要具有其中任意一个权限等。
    Match matchType() default Match.HAS_ANY;
}
