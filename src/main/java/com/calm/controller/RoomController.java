package com.calm.controller;

import com.calm.pojo.Room;
import com.calm.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class RoomController {
    @Autowired
    private RoomService roomService;

    // Show all rooms
    @RequestMapping("/meetingRoom")
    public String toMeetingRoom(Model model) {
        List<Room> rooms = roomService.getAllRoom();

        model.addAttribute("rooms", rooms);
        return "room/meetingRoom";
    }

    // room detail
    @GetMapping("/roomDetail/{id}")
    public String roomDetail(@PathVariable("id") int id, Model model) {
        Room room = roomService.getRoomById(id);
        System.out.println(room);
        model.addAttribute("room", room);
        return "room/roomDetail";

    }

    // update Room
    @PostMapping("/updateRoom")
    public String updateRoom(Room room) {
        System.out.println(room);
        int result = roomService.updateRoom(room);
        if (result == 1) {
            return "redirect:/meetingRoom";
        } else {
            return "forward:/roomDetail/" + room.getId();
        }

    }

    // add room
    @RequestMapping("/admin/addMeetingRoom")
    public String toAddMeetingRoom() {
        return "admin/addMeetingRoom";

    }

    @RequestMapping("/admin/doAddMr")
    public String doAddMr(Room room) {
        System.out.println(room);
        int result = roomService.addRoom(room);
        if (result == 1) {
            return "redirect:/meetingRoom";
        } else {
            return "forward:/admin/doAddMr";
        }


    }

}
