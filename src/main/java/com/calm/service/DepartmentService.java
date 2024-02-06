package com.calm.service;

import com.calm.pojo.Department;

import java.util.List;

public interface DepartmentService {

    // Obtain department by name
    Department getDeptByName(String name);

    // Get all departments
    List<Department> getAllDepts();

    // add department
    int addDept(String name);

    // delete department
    int deleteDeptById(int id);

    // update department
    int updateDeptById(int id, String deptName);

}
