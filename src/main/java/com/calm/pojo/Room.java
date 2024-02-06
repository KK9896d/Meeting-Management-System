package com.calm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Room entity
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room implements Serializable {
    private int id;
    private int roomNum;
    private String name;
    private int capacity;
    private String status;
    private String desc;

}
