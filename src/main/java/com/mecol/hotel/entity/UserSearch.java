package com.mecol.hotel.entity;

public class UserSearch
{
    private String username;
    private String gender;
    private String realname;
    private String status;
    private String create_time_s;
    private String create_time_e;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreate_time_s() {
        return create_time_s;
    }

    public void setCreate_time_s(String create_time_s) {
        this.create_time_s = create_time_s;
    }

    public String getCreate_time_e() {
        return create_time_e;
    }

    public void setCreate_time_e(String create_time_e) {
        this.create_time_e = create_time_e;
    }

    @Override
    public String toString() {
        return "UserSearch{" +
                "username='" + username + '\'' +
                ", gender='" + gender + '\'' +
                ", realname='" + realname + '\'' +
                ", status='" + status + '\'' +
                ", create_time_s='" + create_time_s + '\'' +
                ", create_time_e='" + create_time_e + '\'' +
                '}';
    }
}
