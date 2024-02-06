package com.calm.controller;

import com.calm.pojo.Employee;
import com.calm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class EmployeeController {

    public static final String NORMAL = "0"; // normal
    public static final String BANNED = "2"; // stop using
    public static final int PAGE_SIZE = 10;

    @Autowired
    private EmployeeService employeeService;

    // Query Employees
    @RequestMapping("/searchEmployee")
    public String searchEmployee(Employee employee, @RequestParam(defaultValue = "1") int page, Model model) {
        List<Employee> emps = employeeService.getEmployeeBySpecification(employee, page, PAGE_SIZE);
        int total = employeeService.countEmpSizeBySpecification(employee);
        model.addAttribute("emps", emps);
        model.addAttribute("total", total);
        model.addAttribute("page", page);
        int pageNum = total % PAGE_SIZE == 0 ? total / PAGE_SIZE : total / PAGE_SIZE + 1;
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("employee", employee);

        return "admin/searchEmployee";

    }

    //Turn off user account status and set it to 2
    @GetMapping("/closeEmp/{id}")
    public String closeEmp(@PathVariable int id) {
        employeeService.updateEmpStatus(id, BANNED);
        return "redirect:/admin/searchEmployee?status=1";

    }

}
