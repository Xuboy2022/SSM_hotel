package com.mecol.hotel.service;

import com.mecol.hotel.entity.RoomCatalog;
import com.mecol.hotel.entity.RoomInfo;
import com.mecol.hotel.entity.RoomSearch;
import com.mecol.hotel.entity.UserSearch;
import com.mecol.hotel.util.ResultUtil;

import java.util.List;

public interface RoomService {
    ResultUtil getCatalogList(Integer page, Integer limit);

    RoomCatalog getCatalogById(Integer room_catalog_id);

    RoomCatalog getCatalogByCatalogName(String catalog);

    void updateCatalog(RoomCatalog roomCatalog);

    void delCatalogById(Integer room_catalog_id);

    void addCatalog(RoomCatalog roomCatalog);

    List<RoomCatalog> getAllCatalogs();

    RoomInfo getRoomByNum(String roomNum);

    void insRoom(RoomInfo roomInfo);

    ResultUtil getRoomList(Integer page, Integer limit);

    RoomInfo getRoomById(Integer room_info_id);

    void updRoom(RoomInfo roomInfo);

    void delRoomById(Integer room_info_id);


    ResultUtil getRoomListSearch(Integer page, Integer limit, RoomSearch roomSearch);
}
