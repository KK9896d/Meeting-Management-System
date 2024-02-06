package com.calm.service;

import com.calm.pojo.Employee;

import java.util.List;

public interface EmployeeService {

    // login
    Employee loginEmployee(String username, String password);

    // register
    int registerEmployee(Employee employeee);

    // Get Users
    Employee getEmployeeByUsername(String username);

    // Obtain employees based on their status
    List<Employee> getEmployeeByStatus(String status);

    // Account review, pass or fail
    int updateEmpStatus(int id, String status);

    // Paging to retrieve employees
    List<Employee> getEmployeeBySpecification(Employee employee, int page, int pageSize);

    // Counting the number of employees
    int countEmpSizeBySpecification(Employee employee);

    // Obtain employees under a certain department
    List<Employee> getEmpByDeptId(int deptId);

    // Change password
    int updateEmpPwdById(int id, String password);

    // Obtain employees based on ID
    Employee getEmployeeById(int id);

    // Obtain employees under the meeting
    List<Employee> getEmployeeByMeetingId(int meetingId);

    // Modify employee's department
    int updateEmpDeptIdByDeptId(int deptId, int newDeptId);

}
