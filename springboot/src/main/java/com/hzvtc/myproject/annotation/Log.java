package com.hzvtc.myproject.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//定义了一个Java自定义注解（Annotation），名为Log。
//注解是Java提供的一种元编程（metaprogramming）的方式，
//它允许程序员为代码添加元数据，这些元数据可以在编译时或运行时被读取和处理。


//这个注解表示`Log`注解只能被用于方法上。`ElementType.METHOD`是`ElementType`枚举的一个值，表示方法。
@Target(ElementType.METHOD)
//这个注解表示`Log`注解的生命周期是运行时。也就是说，这个注解在运行时可以被读取，通常用于那些需要在运行时通过反射获取注解信息的场景。
// `RetentionPolicy.RUNTIME`是`RetentionPolicy`枚举的一个值，表示注解信息会保留在运行时。
@Retention(RetentionPolicy.RUNTIME)
//定义了一个名为`Log`的公共注解接口。在Java中，注解是通过`@interface`关键字定义的，而不是普通的`interface`。
public @interface Log {
//    这定义了一个名为`value`的元素，其类型为`String`。
//    这个元素有一个默认值，即空字符串。
//    当使用这个注解时，可以为`value`元素提供一个字符串值，如果不提供，那么它会使用默认值。
    String value() default "";
}
