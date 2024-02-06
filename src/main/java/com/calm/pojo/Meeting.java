package com.calm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * Meeting entity
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Meeting implements Serializable {
    private int id;
    private String name;
    private int roomId;
    private int reserveId;
    private int numberOfPerson;
    private Date startTime;
    private Date endTime;
    private Date reserveTime;
    private String desc;
    private String status;
    private Date cancelTime;
    private String cancelReason;

}
