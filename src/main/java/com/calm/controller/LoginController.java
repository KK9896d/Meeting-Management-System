package com.calm.controller;

import com.calm.pojo.Department;
import com.calm.pojo.Employee;
import com.calm.service.DepartmentService;
import com.calm.service.EmployeeService;
import com.calm.utils.Md5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * login & register
 */

@Controller
public class LoginController {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private DepartmentService departmentService;

    // login
    @RequestMapping({"login", "login.html"})
    public String toLogin() {
        return "login";
    }

    @PostMapping("/doLogin")
    public String doLogin(String username, String password, Model model, HttpSession httpSession) {
        System.out.println(username + password);

        Employee employee = employeeService.loginEmployee(username, Md5Utils.hash((password)));
        if (employee == null) {
            model.addAttribute("error", "Incorrect username or password");
            return "forward:/login";
        } else if ("1".equals(employee.getStatus())) {
            model.addAttribute("error", "User not approved");
            return "forward:/login";
        } else if ("2".equals(employee.getStatus())) {
            model.addAttribute("error", "User approval not approved");
            return "forward:/login";
        } else {
            httpSession.setAttribute("user", employee);
            return "redirect:/notice";
        }

    }

    // Log out
    @RequestMapping("/logOut")
    public String logOut(HttpSession httpSession) {
        httpSession.setAttribute("user", null);
        return "redirect:/login";
    }

    // register
    @RequestMapping("/register")
    public String toRegister(Model model) {
        List<Department> depts = departmentService.getAllDepts();
        System.out.println(depts);

        model.addAttribute("depts", depts);
        return "register";
    }

    @PostMapping("/doRegister")
    public String doRegister(Employee employee, Model model, HttpSession session) {
        System.out.println(employee);
        int i = employeeService.registerEmployee(employee);
        if (i == 1) {
            session.setAttribute("user", null);
            return "redirect:/login";
        } else {
            model.addAttribute("error", "login has failed");
            model.addAttribute("employee", employee);
            return "forward:/register";
        }

    }

    // change password
    @RequestMapping("/changePassword")
    public String toChangePassword() {
        return "changePassword";
    }

    @RequestMapping("/doChangePassword")
    public String doChangePassword(String oldPassword, String newPassword, Model model, HttpSession httpSession) {
        System.out.println(oldPassword);
        System.out.println(newPassword);

        Employee e = (Employee) httpSession.getAttribute("user");
        String username = e.getUsername();
        int empId = e.getId();
        // Verify if the original password is correct
        Employee emp = employeeService.loginEmployee(username, Md5Utils.hash((oldPassword)));
        if (emp == null) {
            model.addAttribute("error", "Original password verification failed");
            return "forward:/changePassword";
        }

        int result = employeeService.updateEmpPwdById(empId, Md5Utils.hash((newPassword)));
        if (result != 1) {
            model.addAttribute("error", "Password modification failed");
            return "forward:/changePassword";
        }
        return "redirect:/login";// Password changed successfully, log in again

    }

}
