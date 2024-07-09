package com.hzvtc.myproject.entity;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Data
public class TestDO {

    private Integer id;
    @Size(min = 3, max = 6)
    private String name;
    @NotNull
    private String a;
}
