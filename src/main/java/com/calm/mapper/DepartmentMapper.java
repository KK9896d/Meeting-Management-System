package com.calm.mapper;

import com.calm.pojo.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {

    Department getDeptByName(@Param("name")String name);

    List<Department> getAllDepts();

    int addDept(@Param("name")String name);

    int deleteDeptById(@Param("id")int id);

    int updateDeptById(@Param("id")int id, @Param("name")String deptName);
}
