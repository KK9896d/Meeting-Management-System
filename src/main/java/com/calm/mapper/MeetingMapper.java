package com.calm.mapper;

import com.calm.pojo.vo.MeetingVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MeetingMapper {

    List<MeetingVo> getMeetingByReserveId(@Param("reserveId")int reserveId);

    List<MeetingVo> getMeetingByEmpId(@Param("empId")int empId);

    MeetingVo getMeetingById(@Param("id")int meetingId);

    int cancelMeetingById(@Param("id")int meetingId, @Param("reason")String cancelReason);

    List<MeetingVo> getMeetingByMap(Map<String, Object> map);

    int addMeeting(MeetingVo meetingVo);

    int addEmpToMeeting(MeetingVo meetingVo);

}
