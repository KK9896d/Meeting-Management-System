package com.calm.pojo.vo;

import com.calm.pojo.Employee;
import com.calm.pojo.Meeting;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * Forwarding data classes
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=true)
public class MeetingVo extends Meeting {

    private String roomName;

    private String reserveName;

    private List<Employee> employeeList;

}
