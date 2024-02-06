package com.calm.mapper;

import com.calm.pojo.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {

    Employee getEmployeeByUsernameAndPassword(@Param("username")String username, @Param("password")String password);

    int addEmployee(Employee employee);

    Employee getEmployeeByUsername(@Param("username")String username);

    List<Employee> getEmployeeByStatus(@Param("status")String status);

    int updateEmpStatus(@Param("id")int id, @Param("status")String status);

    List<Employee> getEmployeeBySpecification(@Param("emp")Employee emp, @Param("startIndex")int startIndex, @Param("pageSize")int pageSize);

    int countEmpSizeBySpecification(Employee employee);

    List<Employee> getEmpByDeptId(@Param("deptId")int deptId);

    int updateEmpPwdById(@Param("id")int id, @Param("password")String password);

    Employee getEmployeeById(@Param("empId")int id);

    List<Employee> getEmployeeByMeetingId(@Param("meetingId")int meetingId);

    int updateEmpDeptIdByDeptId(@Param("deptId")int deptId, @Param("newDeptId")int newDeptId);
}
