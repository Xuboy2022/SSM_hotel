package com.mecol.hotel.entity;

public class RoomSearch {
    private String room_num;
    private String room_catalog_id;

    public String getRoom_num() {
        return room_num;
    }

    public void setRoom_num(String room_num) {
        this.room_num = room_num;
    }

    public String getCatalog() {
        return room_catalog_id;
    }

    public void setCatalog(String room_catalog_id) {
        this.room_catalog_id = room_catalog_id;
    }

    @Override
    public String toString() {
        return "RoomSearch{" +
                "room_num='" + room_num + '\'' +
                ", catalog='" + room_catalog_id + '\'' +
                '}';
    }
}
