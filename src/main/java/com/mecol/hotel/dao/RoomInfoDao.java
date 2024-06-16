package com.mecol.hotel.dao;

import com.mecol.hotel.entity.Reservation;
import com.mecol.hotel.entity.RoomInfo;
import com.mecol.hotel.entity.RoomSearch;

import java.util.List;

public interface RoomInfoDao {
    RoomInfo getRoomByNum(String roomNum);

    void insRoom(RoomInfo roomInfo);

    List<RoomInfo> getRoomList();

    RoomInfo getRoomById(Integer room_info_id);
    RoomInfo getRoomByIdWithStatus1(Integer room_info_id);
    RoomInfo getRoomByIdWithStatus2(Integer room_info_id);
    void updRoom(RoomInfo roomInfo);

    void delRoomById(Integer room_info_id);

    List<RoomInfo> getRoomListSearch(RoomSearch roomSearch);

}
