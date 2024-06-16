package com.mecol.hotel.dao;

import com.mecol.hotel.entity.Role;

import java.util.List;

public interface RoleDao
{
    List<Role> selRoles();
    void delRole(Long roleId);
    Role getRoleById(Long id);
    Role getRoleByRoleName(String roleName);

    void updateByKey(Role role);

    void insertRole(Role role);

    Role selectRoleByRoleName(String roleName);
}
