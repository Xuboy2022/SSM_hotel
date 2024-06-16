package com.mecol.hotel.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Reservation
{
    private Integer reservation_id;
    private Integer status;   //0表示预定状态 1表示退房后成为历史订单
    private Date  order_time;
    private Integer days;

    //如果是前台传过来的日期 必须加上DateTimeFormat进行转换
    //但是如果是java内创建的日期就不需要了如上面的order_time
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date check_in_time;

    private String check_in_name;
    private String check_in_phone;
    private Integer user_id;
    private Integer room_info_id;
    //预约和房间之间是一对一关系
    private RoomInfo roomInfo;

    public RoomInfo getRoomInfo() {
        return roomInfo;
    }

    public void setRoomInfo(RoomInfo roomInfo) {
        this.roomInfo = roomInfo;
    }

    //预约与用户之间是多对一的关系
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(Integer reservation_id) {
        this.reservation_id = reservation_id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Date order_time) {
        this.order_time = order_time;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public Date getCheck_in_time() {
        return check_in_time;
    }

    public void setCheck_in_time(Date check_in_time) {
        this.check_in_time = check_in_time;
    }

    public String getCheck_in_name() {
        return check_in_name;
    }

    public void setCheck_in_name(String check_in_name) {
        this.check_in_name = check_in_name;
    }

    public String getCheck_in_phone() {
        return check_in_phone;
    }

    public void setCheck_in_phone(String check_in_phone) {
        this.check_in_phone = check_in_phone;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getRoom_info_id() {
        return room_info_id;
    }

    public void setRoom_info_id(Integer room_info_id) {
        this.room_info_id = room_info_id;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "reservation_id=" + reservation_id +
                ", status=" + status +
                ", order_time=" + order_time +
                ", days=" + days +
                ", check_in_time=" + check_in_time +
                ", check_in_name='" + check_in_name + '\'' +
                ", check_in_phone='" + check_in_phone + '\'' +
                ", user_id=" + user_id +
                ", room_info_id=" + room_info_id +
                ", roomInfo=" + roomInfo +
                ", user=" + user +
                '}';
    }
}
