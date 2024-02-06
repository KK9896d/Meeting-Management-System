package com.calm.controller;

import com.calm.pojo.Department;
import com.calm.service.DepartmentService;
import com.calm.service.EmployeeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/admin/depts")
    public String toDepartments(Model model) {
        List<Department> depts = departmentService.getAllDepts();
        model.addAttribute("depts", depts);

        return "admin/departments";
    }

    // Respond to front-end ajax requests and return all department data
    @RequestMapping("/getAllDepts")
    @ResponseBody
    public List<Department> getAllDepts() {
        List<Department> depts = departmentService.getAllDepts();
        return depts;
    }

    // New department added
    @RequestMapping("/admin/addDept")
    public String addDept(String name, Model model) {
        if (StringUtils.isBlank(name)) {
            model.addAttribute("error", "Department name cannot be empty");
            return "forward:/admin/depts";
        }

        Department dept = departmentService.getDeptByName(name);
        if (dept != null) {
            model.addAttribute("error", "Duplicate department name");
            return "forward:/admin/depts";
        }

        int i = departmentService.addDept(name);
        if (i != 1) {
            model.addAttribute("error", "Failed to add department");
            return "forward:/admin/depts";
        }
        return "redirect:/admin/depts";
    }

    // Delete Department
    @RequestMapping("/admin/deleteDept/{id}")
    public String deleteDept(@PathVariable("id") int id, Model model) {
        // The department ID attribute of an existing employee under the deleted department is set to 0
        employeeService.updateEmpDeptIdByDeptId(id, 0);

        int result = departmentService.deleteDeptById(id);
        if (result != 1) {
            model.addAttribute("error", "Failed to delete department");
            return "forward:/admin/depts";
        }
        return "redirect:/admin/depts";
    }

    // Respond to front-end ajax requests and modify department data
    @RequestMapping(value = "/admin/updateDept", produces = {"text/html;charset=utf-8;"})
    @ResponseBody
    public String updateDept(int id, String name) {
        Department dept = departmentService.getDeptByName(name);
        if (dept != null) {
            return "Duplicate department name";
        }

        int result = departmentService.updateDeptById(id, name);
        if (result != 1) {
            return "Failed to update department name";
        }
        return "success";

    }

}
