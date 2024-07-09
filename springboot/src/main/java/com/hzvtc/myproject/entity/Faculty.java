package com.hzvtc.myproject.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.util.List;


@Data
@Accessors(chain = true)
public class Faculty {
    private Long id;

    @NotBlank
    private String name;

    private Long parentId;

    private Integer orderNum;

    private List<Faculty> children;

    private Integer studentNum;

    private List<Student> students;
}
