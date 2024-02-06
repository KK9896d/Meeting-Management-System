package com.calm.controller;

import com.calm.pojo.Employee;
import com.calm.pojo.vo.MeetingVo;
import com.calm.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class NoticeController {
    @Autowired
    private MeetingService meetingService;

    // Home page, notification page, displaying employee related meetings
    @GetMapping({"/", "/notice", "/index", "/index.html"})
    public String notice(Model model, HttpSession session) {
        Employee emp = (Employee) session.getAttribute("user");
        int empId = emp.getId();

        List<MeetingVo> meetingList = meetingService.getMeetingByEmpId(empId);
        List<MeetingVo> normalMeetings = new ArrayList<>();
        List<MeetingVo> cancelMeetings = new ArrayList<>();

        for (MeetingVo meetingVo : meetingList) {
            if ("0".equals(meetingVo.getStatus())) {
                normalMeetings.add(meetingVo);
            } else {
                cancelMeetings.add(meetingVo);
            }
        }
        System.out.println(normalMeetings);
        System.out.println(cancelMeetings);

        model.addAttribute("normalMeetings", normalMeetings);
        model.addAttribute("cancelMeetings", cancelMeetings);
        return "notice";

    }

}
