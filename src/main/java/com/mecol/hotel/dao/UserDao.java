package com.mecol.hotel.dao;

import com.mecol.hotel.entity.Reservation;
import com.mecol.hotel.entity.User;
import com.mecol.hotel.entity.UserSearch;
import com.mecol.hotel.util.ResultUtil;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    void insUser(User user);

    User login(@Param("username")String username, @Param("password")String password);

    User getUserById(Integer user_id);

    void updateUser(User user);

    User getUserByUserName(String username);

    List<User> getAllUserList(UserSearch search);

    void updateUserStatusById(@Param("user_id")int user_id, @Param("status")int status);

    void deleteUserById(int user_id);


}
