package com.calm.service.impl;

import com.calm.mapper.MeetingMapper;
import com.calm.pojo.vo.MeetingVo;
import com.calm.service.MeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MeetingServiceImpl implements MeetingService {

    @Autowired
    private MeetingMapper meetingMapper;


    @Override
    public List<MeetingVo> getMeetingByReserveId(int reserveId) {
        return meetingMapper.getMeetingByReserveId(reserveId);
    }

    @Override
    public List<MeetingVo> getMeetingByEmpId(int empId) {
        return meetingMapper.getMeetingByEmpId(empId);
    }

    @Override
    public MeetingVo getMeetingById(int id) {
        return meetingMapper.getMeetingById(id);
    }

    @Override
    public int cancelMeetingById(int meetingId, String cancelReason) {
        return meetingMapper.cancelMeetingById(meetingId, cancelReason);
    }

    @Override
    public List<MeetingVo> getMeetingByMap(Map<String, Object> map) {
        return meetingMapper.getMeetingByMap(map);
    }

    @Override
    public int addMeeting(MeetingVo meetingVo) {
        System.out.println(meetingVo.getId());
        if(meetingVo.getEmployeeList().size()!=0) {
            meetingMapper.addMeeting(meetingVo);
            System.out.println(meetingVo.getId());
            return meetingMapper.addEmpToMeeting(meetingVo);
        }
        return meetingMapper.addMeeting(meetingVo);

    }
}
