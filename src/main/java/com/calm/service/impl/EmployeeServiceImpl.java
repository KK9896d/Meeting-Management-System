package com.calm.service.impl;

import com.calm.mapper.EmployeeMapper;
import com.calm.pojo.Employee;
import com.calm.service.EmployeeService;
import com.calm.utils.Md5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public Employee loginEmployee(String username, String password) {
        return employeeMapper.getEmployeeByUsernameAndPassword(username, password);
    }

    @Override
    public int registerEmployee(Employee employee) {
        Employee e = employeeMapper.getEmployeeByUsername(employee.getUsername());
        if (e != null) {
            return -1; // username already exists
        }

        employee.setRole("2"); // general users
        employee.setStatus("1");// pending approval
        employee.setPassword(Md5Utils.hash((employee.getPassword()))); //encryption
        return employeeMapper.addEmployee(employee);
    }

    @Override
    public Employee getEmployeeByUsername(String username) {
        return employeeMapper.getEmployeeByUsername(username);
    }

    @Override
    public List<Employee> getEmployeeByStatus(String status) {
        return employeeMapper.getEmployeeByStatus(status);
    }

    @Override
    public int updateEmpStatus(int id, String status) {
        return employeeMapper.updateEmpStatus(id, status);
    }

    @Override
    public List<Employee> getEmployeeBySpecification(Employee employee, int page, int pageSize) {
        int startIndex = (page - 1) * pageSize;
        return employeeMapper.getEmployeeBySpecification(employee, startIndex, pageSize);
    }

    @Override
    public int countEmpSizeBySpecification(Employee employee) {
        return employeeMapper.countEmpSizeBySpecification(employee);
    }

    @Override
    public List<Employee> getEmpByDeptId(int deptId) {
        return employeeMapper.getEmpByDeptId(deptId);
    }

    @Override
    public int updateEmpPwdById(int id, String password) {
        return employeeMapper.updateEmpPwdById(id, password);
    }

    @Override
    public Employee getEmployeeById(int id){
        return employeeMapper.getEmployeeById(id);
    }

    @Override
    public List<Employee> getEmployeeByMeetingId(int meetingId){
        return employeeMapper.getEmployeeByMeetingId(meetingId);
    }

    @Override
    public int updateEmpDeptIdByDeptId(int deptId, int newDeptId) {
        return employeeMapper.updateEmpDeptIdByDeptId(deptId, newDeptId);
    }

}
