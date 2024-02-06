package com.calm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Employee entity
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee implements Serializable {

    private int id;
    private String username;
    private String password;
    private String realName;
    private String phone;
    private String email;
    private String status;
    private int deptId;
    private String role;

}
