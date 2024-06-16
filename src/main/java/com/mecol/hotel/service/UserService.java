package com.mecol.hotel.service;

import com.mecol.hotel.entity.Menu;
import com.mecol.hotel.entity.User;
import com.mecol.hotel.entity.UserSearch;
import com.mecol.hotel.util.ResultUtil;

import java.util.List;

public interface UserService {
    void insUser(User user);

    User login(String username, String password);

    List<Menu> getMenus(User user1);

    User getUserById(Integer user_id);

    ResultUtil updateUser(User user);

    User getUsertByUserName(String username);

    ResultUtil getAllUserList(Integer page, Integer limit, UserSearch search);

    ResultUtil updateUserStatusById(int id, int status);

    ResultUtil deleteUserById(int user_id);


}
