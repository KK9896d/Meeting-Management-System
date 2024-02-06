package com.calm.service.impl;

import com.calm.mapper.DepartmentMapper;
import com.calm.pojo.Department;
import com.calm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;


    @Override
    public Department getDeptByName(String name) {
        return departmentMapper.getDeptByName(name);
    }

    @Override
    public List<Department> getAllDepts() {
        return departmentMapper.getAllDepts();
    }

    @Override
    public int addDept(String name) {
        Department dept = departmentMapper.getDeptByName(name);
        if(dept!=null){
            return -1;
        }
        return departmentMapper.addDept(name);

    }

    @Override
    public int deleteDeptById(int id) {
        return departmentMapper.deleteDeptById(id);
    }

    @Override
    public int updateDeptById(int id, String deptName) {
        return departmentMapper.updateDeptById(id, deptName);
    }
}
