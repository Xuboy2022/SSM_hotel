package com.mecol.hotel.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Comment
{
    private Integer comment_id;
    private String content;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date pub_date;
    private Integer room_info_id;
    private Integer user_id;

    private RoomInfo roomInfo;

    public RoomInfo getRoomInfo() {
        return roomInfo;
    }

    public void setRoomInfo(RoomInfo roomInfo) {
        this.roomInfo = roomInfo;
    }

    //评论和用户之间是多对一的关系
    private User user;
//给user添加get方法 不然jsp中${comment.user.username}获取不到user属性
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPub_date() {
        return pub_date;
    }

    public void setPub_date(Date pub_date) {
        this.pub_date = pub_date;
    }

    public Integer getRoom_info_id() {
        return room_info_id;
    }

    public void setRoom_info_id(Integer room_info_id) {
        this.room_info_id = room_info_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comment_id=" + comment_id +
                ", content='" + content + '\'' +
                ", pub_date=" + pub_date +
                ", room_info_id=" + room_info_id +
                ", user_id=" + user_id +
                ", roomInfo=" + roomInfo +
                ", user=" + user +
                '}';
    }
}
