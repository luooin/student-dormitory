package com.hzvtc.myproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;


@Data
public class DepartApplicationUser {

    private Long id;

    private Long operateUserId;

    private SystemUser operateUser;

    private Boolean isAgree;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime operateTime;

    private String reason;

    private Long applicationId;

    private DepartApplication application;
}
