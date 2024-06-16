package com.mecol.hotel.entity;

import java.io.Serializable;

public class RoomInfo implements Serializable {
    //主键id
    private Integer room_info_id;
    //房间号
    private String room_num;
    //房间面积
    private Integer area;
    //房间简介
    private String intro;
    //客房价格
    private Double price;
    //客房类别
    private Integer room_catalog_id;
    //客房状态
    private Integer status; //0空闲 1 已预定 2 已入住
    //版本控制
    private Long version;
    private String photo_path;
    private RoomCatalog roomCatalog;
//预定和房间是一对一关系
    private Reservation reservation;

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public RoomCatalog getRoomCatalog() {
        return roomCatalog;
    }

    public void setRoomCatalog(RoomCatalog roomCatalog) {
        this.roomCatalog = roomCatalog;
    }

    public String getPhoto_path() {
        return photo_path;
    }

    public void setPhoto_path(String photo_path) {
        this.photo_path = photo_path;
    }

    public Integer getRoom_info_id() {
        return room_info_id;
    }

    public void setRoom_info_id(Integer room_info_id) {
        this.room_info_id = room_info_id;
    }

    public String getRoom_num() {
        return room_num;
    }

    public void setRoom_num(String room_num) {
        this.room_num = room_num;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getRoom_catalog_id() {
        return room_catalog_id;
    }

    public void setRoom_catalog_id(Integer room_catalog_id) {
        this.room_catalog_id = room_catalog_id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    @Override
    public String toString() {
        return "RoomInfo{" +
                "room_info_id=" + room_info_id +
                ", room_num='" + room_num + '\'' +
                ", area=" + area +
                ", intro='" + intro + '\'' +
                ", price=" + price +
                ", room_catalog_id=" + room_catalog_id +
                ", status=" + status +
                ", version=" + version +
                ", photo_path='" + photo_path + '\'' +
                ", roomCatalog=" + roomCatalog +
                ", reservation=" + reservation +
                '}';
    }
}

