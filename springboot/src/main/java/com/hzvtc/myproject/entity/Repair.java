package com.hzvtc.myproject.entity;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.List;


@Data
public class Repair {
    private Long id;

    @NotNull
    private Long roomId;

    @NotBlank
    private String describe;

    private List<String> picture;

    private Boolean status;

    private LocalDate createDate;

    private LocalDate finishDate;

    private Room room;
}
