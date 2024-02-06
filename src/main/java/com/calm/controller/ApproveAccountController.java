package com.calm.controller;

import com.calm.pojo.Employee;
import com.calm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class ApproveAccountController {

    public static final String PENDING_APPROVE = "1"; // Unaudited

    @Autowired
    private EmployeeService employeeService;

    // Review user accounts
    @GetMapping("/approveAccount")
    public String approveAccount(Model model) {

        List<Employee> emps = employeeService.getEmployeeByStatus(PENDING_APPROVE);
        model.addAttribute("emps", emps);
        return "admin/approveAccount";

    }

    @GetMapping("/updateEmpStatus")
    public String updateEmpStatus(int id, String status) {
        employeeService.updateEmpStatus(id, status);
        return "redirect:/admin/approveAccount";

    }

}
