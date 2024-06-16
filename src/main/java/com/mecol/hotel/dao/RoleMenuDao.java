package com.mecol.hotel.dao;

import com.mecol.hotel.entity.RoleMenu;

import java.util.List;

public interface RoleMenuDao
{
    List<RoleMenu> selMenusByRoleId(Long roleId);

    void deleteMenusByRoleId(Long roleId);

    void insert(RoleMenu roleMenu);

    void deleteMenuByMenuId(Long menuId);

    List<RoleMenu> getRoleMenuByMenuId(Long menuId);
}
