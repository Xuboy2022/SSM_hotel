package com.mecol.hotel.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mecol.hotel.dao.AdminDao;
import com.mecol.hotel.dao.MenuDao;
import com.mecol.hotel.dao.RoleDao;
import com.mecol.hotel.dao.RoleMenuDao;
import com.mecol.hotel.entity.*;
import com.mecol.hotel.util.EncryptUtil;
import com.mecol.hotel.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.*;

@Service
@Transactional
public class AdminServiceImpl implements AdminService
{
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private RoleMenuDao roleMenuDao;
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private RoleDao roleDao;

    @Override
    public Admin login(String username, String password) {
        return adminDao.login(username,password);
    }

    @Override
    public void insAdminLog(String username, String loginIp, Date loginTime,Date logoutTime,Integer isSafeExit)
    {
        adminDao.insAdminLog(username,loginIp,loginTime,logoutTime,isSafeExit);

    }

    @Override
    public Admin getAdminById(Integer id) {
        return adminDao.getAdminById(id);
    }


    /*******Menu相关的一些***/
    @Override
    public List<Menu> getMenus(Admin admin) {




        List<Menu> menuList=new ArrayList<>();
        Long roleId=admin.getRoleId();
        List<RoleMenu> roleMenus=roleMenuDao.selMenusByRoleId(roleId);
        //rolemenu里面就是一个中间表 两个字段 roleId menuId 关联起来
        if(roleMenus!=null&&roleMenus.size()>0)
        {
            List<Menu> noChildrenMenus=new ArrayList<>();
            for(int i=0;i<roleMenus.size();i++)
            {
                Menu menu=menuDao.getMenuById(roleMenus.get(i).getMenuId()); //获取rolemenu中的menuId
                noChildrenMenus.add(menu); //就是根据这个登陆者的roleid 所拥有的菜单取出来
            }
            for(int i=0;i<noChildrenMenus.size();i++)
            {
                if(noChildrenMenus.get(i).getParentId()==0)
                {
                    Menu menu=new Menu();
                    menu=noChildrenMenus.get(i); //把这个一级菜单取出来
                    List<Menu> menus=new ArrayList<>();
                    for(int j=0;j<noChildrenMenus.size();j++) //把所有菜单过一遍
                    {
                        //如果有菜单属于这个一级菜单
                        if(noChildrenMenus.get(j).getParentId()==noChildrenMenus.get(i).getMenuId())
                        {
                            Menu menu2=new Menu();
                            menu2=noChildrenMenus.get(j);//取出这个二级菜单
                            menus.add(menu2);
                        }
                    }
                    menu.setChildren(menus);
                    menuList.add(menu);
                }
            }

        }

        Collections.sort(menuList, new Comparator<Menu>() {
            @Override
            public int compare(Menu o1, Menu o2) {

                return o1.getSorting().compareTo(o2.getSorting());
            }
        });

        return menuList;
    }

    @Override
    public ResultUtil getAdminList(Integer page, Integer limit)
    {
        PageHelper.startPage(page,limit); //默认传过来的是1 和10

        List<Admin> admins=adminDao.getAdminsList();


        for(Admin admin:admins)
        {
            List<Role> roles=roleDao.selRoles();//取出所有的角色
            for(Role role:roles)
            {
                if(role.getRoleId()==admin.getRoleId())
                {
                    admin.setRoleName(role.getRoleName());

                }
            }
        }

        PageInfo<Admin> pageInfo=new PageInfo<Admin>(admins);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);//前段接收为0 代表成功
        resultUtil.setCount(pageInfo.getTotal());//代表数据库中总条数
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public List<Role> getRoles() {
        return roleDao.selRoles();
    }

    @Override
    public ResultUtil getRoles(Integer page, Integer limit) {
        PageHelper.startPage(page,limit);
        List<Role> roles=roleDao.selRoles();
        PageInfo<Role> pageInfo=new PageInfo<Role>(roles);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public void updAdmin(Admin admin)
    {
        adminDao.updAdmin(admin);
    }

    @Override
    public void delAdminById(Long id) {
        adminDao.delAdminById(id);
    }

    @Override
    public Admin getAdminByUsername(String username) {
        return adminDao.getAdminByUsername(username);
    }

    @Override
    public void insAdmin(Admin admin) {
        admin.setPassword(EncryptUtil.encrypt(admin.getPassword()));//加密
        adminDao.insAdmin(admin);
    }

    @Override
    public void delRole(Long roleId) {
        roleDao.delRole(roleId);
    }

    @Override
    public Role getRoleById(Long roleId) {
        return roleDao.getRoleById(roleId);
    }
    /*
    @Override
    public List<Menu> getXtreeData(Admin admin)
    {
        List<Menu> allMenus=menuDao.getAllMenus(); //获得所有的菜单
        Long roleId=admin.getRoleId(); //中间用admin做介质 有必要吗？？
        if(!roleId.equals(Long.valueOf("-1")))//不是-1
        {
            List<RoleMenu> roleMenus=roleMenuDao.selMenusByRoleId(roleId); //选出此角色对应的菜单
            for(Menu menu:allMenus) //遍历所有菜单
            {
                for(RoleMenu roleMenu:roleMenus)
                {
                    if(roleMenu.getMenuId()==menu.getMenuId())
                    {
                        menu.setChecked("true"); //将所有菜单中 此角色有的菜单
                        // 设置为true状态 前面权限树 会体现出选中状态 看看那个tree的原理 为什么会选中？？？？？
                    }
                }

            }

        }
        return allMenus;
    }
*/
    @Override
    public List<Menu> getXtreeData(Long roleId) {
        List<Menu> allMenus=menuDao.getAllMenus(); //获得所有的菜单
        if(!roleId.equals(Long.valueOf("-1")))//不是-1
        {
            List<RoleMenu> roleMenus=roleMenuDao.selMenusByRoleId(roleId); //选出此角色对应的菜单
            for(Menu menu:allMenus) //遍历所有菜单
            {
                for(RoleMenu roleMenu:roleMenus)
                {
                    if(roleMenu.getMenuId()==menu.getMenuId())
                    {
                        menu.setChecked("true"); //将所有菜单中 此角色有的菜单


                    }
                }

            }

        }
        return allMenus;
    }

    @Override
    public Role getRoleByRoleName(String roleName) {
        return roleDao.getRoleByRoleName(roleName);
    }

    @Override
    public void updRole(Role role, String m) {
     roleDao.updateByKey(role);
     roleMenuDao.deleteMenusByRoleId(role.getRoleId()); //把roleId对应的原来的菜单都删除
        // 维护角色-菜单表 m中就是 1,2,3,4,5 这种格式
        if(m!=null&&m.length()!=0)
        {
            String [] result=m.split(",");
            //重新赋予权限
            if(result!=null&&result.length>0)
            {
                for(int i=0;i<result.length;i++)
                {
                    RoleMenu roleMenu=new RoleMenu();
                    roleMenu.setMenuId(Long.parseLong(result[i]));
                    //Menu menu=menuDao.getMenuById(Long.parseLong(result[i]));// 这一句感觉应该没有用
                    roleMenu.setRoleId(role.getRoleId());
                    //插入一条数据
                    roleMenuDao.insert(roleMenu);
                }
            }
        }
    }

    @Override
    public void insRole(Role role, String m) {
        roleDao.insertRole(role); //插入一条新数据
        Role role2=roleDao.selectRoleByRoleName(role.getRoleName()); //把新插入的读出来
        if(m!=null&&m.length()!=0)
        {
            String [] result=m.split(",");
            if(result!=null&&result.length>0)
            {
                for(int i=0;i<result.length;i++)
                {
                    RoleMenu roleMenu=new RoleMenu();
                    roleMenu.setMenuId(Long.parseLong(result[i]));
                    roleMenu.setRoleId(role2.getRoleId());
                    roleMenuDao.insert(roleMenu);
                }
            }
        }

    }

    @Override
    public List<Menu> getAllMenus() {
        return menuDao.getAllMenus();
    }

    @Override
    public void updMenuSortingById(Menu menu) {
        Menu menu1=menuDao.getMenuById(menu.getMenuId()); //更新对象之前 先读出来
        menu1.setSorting(menu.getSorting()); //设置新的排序
        menuDao.updateMenuByKey(menu1); //更新
    }

    @Override
    public Menu getMenuById(Long menuId) {
        return menuDao.getMenuById(menuId);
    }

    @Override
    public List<Menu> checkNameSameLevel(Menu menus) {
        return menuDao.checkNameSameLevel(menus);
    }

    @Override
    public void insMenu(Menu menus) {
        menuDao.insMenu(menus);
    }

    @Override
    public void updMenu(Menu menus) {
        menuDao.updateMenu(menus);
    }

    @Override
    public List<Menu> getMenusByParentId(Long menuId) {
        return menuDao.getMenuByParentId(menuId);
    }

    @Override
    public void delMenuById(Long menuId) {
        menuDao.delMenuById(menuId);
        roleMenuDao.deleteMenuByMenuId(menuId);
    }

    @Override
    public List<RoleMenu> getRoleMenuByMenuId(Long menuId) {
        return roleMenuDao.getRoleMenuByMenuId(menuId);
    }

    @Override
    public AdminLog getAdminLogByUsername(String username) {
        return adminDao.getAdminLogByUsername(username);
    }

    @Override
    public void updateAdminLog(AdminLog adminLog) {
        adminDao.updateAdminLog(adminLog);
    }

    @Override
    public AdminLog getAdminLogByLoginTime(Date loginTime) {
        return adminDao.getAdminLogByLoginTime(loginTime);
    }

    @Override
    public ResultUtil getAdminLogList(Integer page, Integer limit) throws ParseException {
        List<AdminLog> adminLogList=new ArrayList<>();

        //带分页的查询 sql server 中 select 语句必须有 order by
        PageHelper.startPage(page,limit);
        List<AdminLog> adminLogs=adminDao.getAdminLogsList();
        PageInfo<AdminLog> pageInfo=new PageInfo<>(adminLogs);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal()-1); //不显示最后一条数据
/*
        for(int i=0;i<pageInfo.getList().size();i++)
        {
            SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
            //java.util.Date对象
            Date date = (Date) sdf.parse(pageInfo.getList().get(i).getLoginTime().toString());
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String formatStr2 = simpleDateFormat.format(date);
            Date loginTime=simpleDateFormat.parse(formatStr2);
            pageInfo.getList().get(i).setLoginTime(loginTime);
        }
*/
        //不显示最后一条登陆信息 因为是正在登陆
        adminLogList.addAll(pageInfo.getList().subList(0,pageInfo.getList().size()-1));

        resultUtil.setData(adminLogList);
        return resultUtil;
    }


}
