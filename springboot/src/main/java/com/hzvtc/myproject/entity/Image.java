package com.hzvtc.myproject.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;


@Data
@Accessors(chain = true)
public class Image {
    private Long id;

    private String saveName;

    private String originalName;

    private String md5;

    private LocalDateTime uploadTime;

    private Long uploadUser;
}
