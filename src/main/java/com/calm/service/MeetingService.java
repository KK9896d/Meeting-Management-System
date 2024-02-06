package com.calm.service;

import com.calm.pojo.vo.MeetingVo;

import java.util.List;
import java.util.Map;

public interface MeetingService {
    // Retrieve meetings based on bookers
    List<MeetingVo> getMeetingByReserveId(int reserveId);

    // Get all the meetings that an employee needs to attend
    List<MeetingVo> getMeetingByEmpId(int empId);

    // Get a single meeting
    MeetingVo getMeetingById(int id);

    // cancel a meeting
    int cancelMeetingById(int meetingId, String cancelReason);

    // Obtain meetings based on specified conditions
    List<MeetingVo> getMeetingByMap(Map<String, Object> map);

    // Add Meeting
    int addMeeting(MeetingVo meetingVo);

}
