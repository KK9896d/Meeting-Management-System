package com.calm.mapper;

import com.calm.pojo.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomMapper {

    List<Room> getAllRoom();

    Room getRoomById(@Param("id")int id);

    int updateRoom(Room room);

    int addRoom(Room room);
}
