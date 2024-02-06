package com.calm.service.impl;

import com.calm.mapper.RoomMapper;
import com.calm.pojo.Room;
import com.calm.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {
    @Autowired
    private RoomMapper roomMapper;

    @Override
    public List<Room> getAllRoom() {
        return roomMapper.getAllRoom();
    }

    @Override
    public Room getRoomById(int id) {
        return roomMapper.getRoomById(id);
    }

    @Override
    public int updateRoom(Room room) {
        return roomMapper.updateRoom(room);
    }

    @Override
    public int addRoom(Room room) {
        return roomMapper.addRoom(room);
    }
}
