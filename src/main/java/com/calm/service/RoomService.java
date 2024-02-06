package com.calm.service;

import com.calm.pojo.Room;

import java.util.List;

public interface RoomService {

    // Get all rooms
    List<Room> getAllRoom();

    // Get a single room
    Room getRoomById(int id);

    // Update Room
    int updateRoom(Room room);

    // Add new room
    int addRoom(Room room);

}
