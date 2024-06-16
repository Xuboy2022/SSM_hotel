package com.mecol.hotel.entity;

import java.io.Serializable;
import java.util.List;

public class RoomCatalog implements Serializable {
    //主键id
    private Integer room_catalog_id;
    //类别名称
    private String catalog;
    private List<RoomInfo> roomInfos;

    public List<RoomInfo> getRoomInfos() {
        return roomInfos;
    }

    public void setRoomInfos(List<RoomInfo> roomInfos) {
        this.roomInfos = roomInfos;
    }

    public Integer getRoom_catalog_id() {
        return room_catalog_id;
    }

    public void setRoom_catalog_id(Integer room_catalog_id) {
        this.room_catalog_id = room_catalog_id;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    @Override
    public String toString() {
        return "RoomCatalog{" +
                "room_catalog_id=" + room_catalog_id +
                ", catalog='" + catalog + '\'' +
                ", roomInfos=" + roomInfos +
                '}';
    }
}

