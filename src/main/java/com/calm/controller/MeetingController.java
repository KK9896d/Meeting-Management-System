package com.calm.controller;

import com.calm.pojo.Employee;
import com.calm.pojo.Room;
import com.calm.pojo.vo.MeetingVo;
import com.calm.service.EmployeeService;
import com.calm.service.MeetingService;
import com.calm.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MeetingController {

    @Autowired
    private MeetingService meetingService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private RoomService roomService;

    // My reservation
    @RequestMapping("/myBooking")
    public String toMyBooking(Model model, HttpSession httpSession){
        Employee emp = (Employee) httpSession.getAttribute("user");
        int reserveId = emp.getId();

        List<MeetingVo> meetingVos = meetingService.getMeetingByReserveId(reserveId);
        System.out.println(meetingVos);
        model.addAttribute("meetingVos", meetingVos);

        return "meeting/myBooking";

    }

    // My Meeting
    @RequestMapping("/myMeeting")
    public String toMyMeeting(Model model, HttpSession httpSession){
        Employee emp = (Employee) httpSession.getAttribute("user");
        int empId = emp.getId();

        List<MeetingVo> meetingVos = meetingService.getMeetingByEmpId(empId);
        System.out.println(meetingVos);
        model.addAttribute("meetingVos", meetingVos);

        return "meeting/myMeeting";

    }

    // Meeting details
    @GetMapping("/meetingDetail/{meetingId}")
    public String toMeetingDetail(@PathVariable("meetingId")int meetingId, Model model){
        MeetingVo meetingVo = meetingService.getMeetingById(meetingId);
        List<Employee> employeeList = employeeService.getEmployeeByMeetingId(meetingId);
        meetingVo.setEmployeeList(employeeList);
        model.addAttribute("meetingVo", meetingVo);

        System.out.println(meetingVo);

        return "meeting/meetingDetail";

    }

    // cancel a meeting
    @GetMapping("/cancelMeeting/{meetingId}")
    public String toCancelMeeting(@PathVariable("meetingId")int meetingId, Model model){
        MeetingVo meetingVo = meetingService.getMeetingById(meetingId);
        model.addAttribute("meetingVo", meetingVo);

        return "meeting/cancelMeeting";

    }

    @PostMapping("/doCancelMeeting")
    public String doCancelMeeting(int id, String cancelReason){
        System.out.println(id+cancelReason);
        int result = meetingService.cancelMeetingById(id, cancelReason);
        if(result!=1){
            System.out.println("Cancel meeting failed");
            return "forward:/cancelMeeting/"+id;//
        }
        return "redirect:/myBooking";

    }

    // Obtain employees under the department based on department ID
    @RequestMapping("/getEmpByDeptId/{deptId}")
    @ResponseBody
    public List<Employee> getEmpByDeptId(@PathVariable("deptId")int deptId) {
        List<Employee> emps = employeeService.getEmpByDeptId(deptId);
        return emps;
    }

    // Schedule Meeting
    @RequestMapping("/bookMeeting")
    public String toBookMeeting(Model model){

        List<Room> rooms = roomService.getAllRoom();
        model.addAttribute("rooms", rooms);

        return "meeting/bookMeeting";

    }

    @RequestMapping("/doAddMeeting")
    public String doAddMeeting(String name,
                               int numberOfPerson,
                               String startTime,
                               String endTime,
                               int roomId,
                               String desc,
                               Integer[] empIds,
                               HttpSession session,
                               Model model) throws ParseException {

        Employee emp = (Employee)session.getAttribute("user");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        MeetingVo meetingVo = new MeetingVo();
        meetingVo.setName(name);
        meetingVo.setNumberOfPerson(numberOfPerson);
        meetingVo.setStartTime(sdf.parse(startTime));
        meetingVo.setEndTime(sdf.parse(endTime));
        meetingVo.setReserveTime(new Date());
        meetingVo.setReserveId(emp.getId());
        meetingVo.setRoomId(roomId);
        meetingVo.setDesc(desc);
        meetingVo.setStatus("0");

        meetingVo.setEmployeeList(new ArrayList<Employee>());

        if(empIds!=null) {
            for (Integer empId : empIds) {
                Employee e = new Employee();
                e.setId(empId);
                meetingVo.getEmployeeList().add(e);
            }
        }

        System.out.println(meetingVo);

        int result = meetingService.addMeeting(meetingVo);
        if(result==0){

            System.out.println("Booking meeting failed");
            return "forward:/bookMeeting";

        }
        return "redirect:/myBooking";

    }

    // Search Meeting
    @RequestMapping("/searchMeeting")
    public String searchMeeting(){
        return "meeting/searchMeeting";
    }

    @RequestMapping("/doSearchMeeting")
    public String doSearchMeeting(String name,
                                  String roomName,
                                  String reserveName,
                                  String reserveTimeFrom,
                                  String reserveTimeTo,
                                  String startTimeFrom,
                                  String startTimeTo,
                                  Model model){
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("roomName", roomName);
        map.put("reserveName", reserveName);
        map.put("reserveTimeFrom", reserveTimeFrom);
        map.put("reserveTimeTo", reserveTimeTo);
        map.put("startTimeFrom", startTimeFrom);
        map.put("startTimeTo", startTimeTo);
        System.out.println(map);

        List<MeetingVo> meetingVos = meetingService.getMeetingByMap(map);
        System.out.println(meetingVos);
        model.addAttribute("meetingVos", meetingVos);

        model.addAttribute("name", name);
        model.addAttribute("roomName", roomName);
        model.addAttribute("reserveName", reserveName);
        model.addAttribute("reserveTimeFrom", reserveTimeFrom);
        model.addAttribute("reserveTimeTo", reserveTimeTo);
        model.addAttribute("startTimeFrom", startTimeFrom);
        model.addAttribute("startTimeTo", startTimeTo);

        return "forward:/searchMeeting";

    }

}
