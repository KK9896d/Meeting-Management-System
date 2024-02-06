package com.calm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Department entity
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Department implements Serializable {
    private int id;
    private String name;

}
