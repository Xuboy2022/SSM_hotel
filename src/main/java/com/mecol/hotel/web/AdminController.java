package com.mecol.hotel.web;


import com.mecol.hotel.dao.ReservationDao;
import com.mecol.hotel.dao.RoomInfoDao;
import com.mecol.hotel.entity.*;
import com.mecol.hotel.service.*;
import com.mecol.hotel.util.EncryptUtil;
import com.mecol.hotel.util.GsonUtil;
import com.mecol.hotel.util.ResultUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController
{
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private RoomInfoDao roomInfoDao;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/login")
    @ResponseBody
    public ResultUtil login(String username, String password, HttpServletRequest request, HttpSession session)
            throws ParseException
    {
        Admin admin=adminService.login(username, EncryptUtil.encrypt(password));
        if(admin!=null)
        {
            session.setAttribute("user",admin); //在拦截器中使用
            session.setAttribute("admin",admin); //在main.jsp中药取出admin
            session.setAttribute("usertype","1");//代表是管理员登录
            // 还有修改密码.jsp等都可以直接取出admin
            String loginIp=request.getHeader("x-forwarded-for");
            if(loginIp==null||loginIp.length()==0||"unknown".equalsIgnoreCase(loginIp))
            {
                loginIp=request.getHeader("Proxy-Client-IP");//获取代理的IP
            }
            if(loginIp==null||loginIp.length()==0||"unknown".equalsIgnoreCase(loginIp))
            {
                loginIp=request.getHeader("WL-Proxy-Client-IP");//获取代理的IP
            }
            if(loginIp==null||loginIp.length()==0||"unknown".equalsIgnoreCase(loginIp))
            {
                loginIp=request.getRemoteAddr();
            }
            Date date=new Date();
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String nowTime=simpleDateFormat.format(date);
            Date loginTime=simpleDateFormat.parse(nowTime);

            Date logoutTime=loginTime;

            Integer isSafeExit=0;  //logoutTime  isSafeExit也要插入 不然在数据库中就是null
            // 然后点击退出的时候会 adminLog.setIsSafeExit(1); 就会包空指针异常
            adminService.insAdminLog(username,loginIp,loginTime,logoutTime,isSafeExit);

            session.setAttribute("adminloginTime",loginTime); //点击退出的时候用的到


            return ResultUtil.ok(admin.getAdmin_id());
        }
        else
            return ResultUtil.error("用户名密码错误，请联系开发者");
    }
    /*************登录Log相关**************/
    //获取所有的登录日志
    @RequestMapping("/getAdminLogList")
    @ResponseBody
    public ResultUtil getAdminLogList(Integer page,Integer limit,HttpSession session)
            throws ParseException
    {

        return adminService.getAdminLogList(page,limit);
    }




    /********Role相关*******/
    //获取角色列表 带分页
    @RequestMapping("/getRoleList")
    @ResponseBody
    public ResultUtil getRoleList(Integer page,Integer limit)
    {

        return adminService.getRoles(page,limit);
    }
    //删除一个角色
    @RequestMapping("/delRole/{roleId}")
    @ResponseBody
    public ResultUtil delRole(@PathVariable("roleId")Long roleId)
    {
        /*

        try{
            adminService.delRole(roleId);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
     */


        adminService.delRole(roleId);
        return ResultUtil.ok();

    }


    @RequestMapping(value="/xtreedata",produces = {"text/json;charset=UTF-8"})
    @ResponseBody
    public String xtreeData(@RequestParam(value="roleId" ,defaultValue="-1") Long roleId )
    {

        //不用admin做中介一样可以
        return GsonUtil.entityToJson(adminService.getXtreeData(roleId));
    }
    // 检查角色是否唯一  编辑角色的视乎用这个函数
    @RequestMapping("/checkRoleName/{roleName}/{roleId}")
    @ResponseBody
    public ResultUtil checkRoleName(@PathVariable("roleName") String roleName,
                                    @PathVariable("roleId") Long roleId)
    {
        //System.out.println(roleName);
        //System.out.println("曹操："+roleId);
        Role role=adminService.getRoleByRoleName(roleName);
        if(role==null)//没有这个角色名 可以
        {
            return new ResultUtil(0);
        }
        else if(role.getRoleId()==roleId) //已经有这个角色名 并且就是这个id 也可以
        {
            return new ResultUtil(0);
        }
        else  //此角色名已存在 别的roleId
        {
            return new ResultUtil(500,"已经存在此角色名");
        }
    }
    // 检查角色是否唯一 添加新角色的时候用这个函数
    @RequestMapping("/checkAddRoleName/{roleName}")
    @ResponseBody
    public ResultUtil checkRoleName(@PathVariable("roleName") String roleName)
    {
        Role role=adminService.getRoleByRoleName(roleName);
        if(role==null)//没有这个角色名 可以
        {
            return new ResultUtil(0);
        }
        else  //此角色名已存在
        {
            return new ResultUtil(500,"已经存在此角色名");
        }
    }

    //更新角色
    @RequestMapping("/updateRole")
    @ResponseBody
    public void updateRole(Role role,String m)
    {
       // System.out.println(role);
       // System.out.println(m);
        adminService.updRole(role,m);
    }
    //添加角色
    @RequestMapping("/insRole")
    @ResponseBody
    public ResultUtil insertRole(Role role,String m)
    {



        adminService.insRole(role,m);
        return ResultUtil.ok();

    }




    /*******管理员相关******/
    //查看管理员的个人信息
    @RequestMapping("/personalDate")
    public String personalDate(HttpSession session)
    {
        Admin admin= (Admin) session.getAttribute("admin");
        Admin admin1=adminService.getAdminById(admin.getAdmin_id());
        session.setAttribute("admin1",admin1);
        return "/jsp/admin/personalInfo";
    }




    @RequestMapping("/getAdminList")
    @ResponseBody
    //获取所有管理员列表 带分页
    public ResultUtil getAdminList(Integer page,Integer limit)
    {
        // Tomcat Localhost Log 会输出错误信息 如果下面的sql语句有问题
        ResultUtil admins=adminService.getAdminList(page,limit);
        //System.out.println(".."+page+"..."+limit);
        return admins;
    }


    @RequestMapping("/getMenus")
    @ResponseBody
    public List<Menu> getMenus(HttpSession session)
    {
        //System.out.println("getmenus进来了");
        List<Menu> menus=null;
        Admin admin= (Admin) session.getAttribute("admin");
        Admin admin1=adminService.getAdminById(admin.getAdmin_id());
        if(admin1!=null)
        {
            menus=adminService.getMenus(admin1); //getMenus函数里只是取出来 并没有实现排序
        }
        return menus;
    }
    //编辑管理员
    @RequestMapping("/editAdmin/{id}")
    public String editAdmin(HttpServletRequest request, @PathVariable("id") int id)
    {
        Admin admin=adminService.getAdminById(id);
        List<Role> roles=adminService.getRoles();
        request.setAttribute("admin",admin);
        request.setAttribute("roles",roles);
        return "/jsp/admin/editAdmin";
    }
    //更新管理员
    @RequestMapping("/updateAdmin")
    @ResponseBody
    public ResultUtil updateAdmin(Admin admin)
    {
        try
        {
            adminService.updAdmin(admin);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }



    //更新管理员
    @RequestMapping("/updAdmin")
    @ResponseBody
    public ResultUtil updAdmin(Admin admin)//这里 前端发送过来的 自动赋值给admin中的同名字段 和之前的一样
    {
       // System.out.println("updAdmin命令进来了");
        if(admin!=null&&admin.getAdmin_id()==1)
        {
            return ResultUtil.error("不允许修改");
        }
        try
        {

            adminService.updAdmin(admin);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }

    }
//修改密码
    @RequestMapping("/changeAdminPassword")
    @ResponseBody
    public ResultUtil changeAdminPassword(String oldPassword,String newPassword1,String username)
    {
        //System.out.println("猜猜"+username);

        Admin admin=adminService.getAdminByUsername(username);
        if(admin!=null)
        {
            if(admin.getPassword().equals(EncryptUtil.encrypt(oldPassword)))
            {
                admin.setPassword(EncryptUtil.encrypt(newPassword1));
                adminService.updAdmin(admin);
                return ResultUtil.ok();
            }
            else
            {
                return ResultUtil.error("旧密码错误，请重新填写");
            }
        }
        return ResultUtil.error("请求出错！！");
    }




  //删除一个管理员
    @RequestMapping("/delAdminById/{id}")
    @ResponseBody
    public ResultUtil delAdminById(@PathVariable("id") Long id)
    {
        if(id==1)
        {
            return ResultUtil.error();
        }
        try {

            adminService.delAdminById(id);
            return ResultUtil.ok();
        }catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }
    //检查是否已经存在此用户名
    @RequestMapping("/checkAdminName/{username}")
    @ResponseBody
    public ResultUtil checkAdminName(@PathVariable("username") String username)
    {
        Admin admin=adminService.getAdminByUsername(username);
        if(admin!=null)
        {
            return new ResultUtil(500,"管理员已存在!");
        }
        return new ResultUtil(0);
    }
    //添加新管理员
    @RequestMapping("/insAdmin")
    @ResponseBody
    public ResultUtil insAdmin(Admin admin)
    {

        adminService.insAdmin(admin);
        return ResultUtil.ok();
    }

    @RequestMapping("/userList")
    public String userList()
    {
        return "/jsp/admin/userList";
    }
    @RequestMapping("/getAllUserList")
    @ResponseBody
    public ResultUtil getAllUserList(Integer page, Integer limit, UserSearch search)
    {
            return userService.getAllUserList(page,limit,search);
    }




    @RequestMapping("/updateUserStatusById")
    @ResponseBody
    public ResultUtil updateUserStatusById(int user_id,int status)
    {

        return userService.updateUserStatusById(user_id,status);
    }
    @RequestMapping("/deleteUserById")
    @ResponseBody
    public ResultUtil deleteUserById(int user_id)
    {
        return userService.deleteUserById(user_id);
    }
    @RequestMapping("/editUser/{user_id}")
    public String editStudent(@PathVariable("user_id")int user_id, HttpSession session)
    {
        User user=userService.getUserById(user_id);
        session.setAttribute("hotel_user",user);
        return "/jsp/user/editUser";
    }


    /********页面跳转*******/
    @RequestMapping("/logOut")
    public ModelAndView loginout(ModelAndView modelAndView,HttpSession session)
            throws ParseException
    {
       // Admin admin= (Admin) session.getAttribute("user");
        //AdminLog adminLog=adminService.getAdminLogByUsername(admin.getUsername());

        Date loginTime= (Date) session.getAttribute("adminloginTime");
        AdminLog adminLog=adminService.getAdminLogByLoginTime(loginTime);

        adminLog.setIsSafeExit(1);

        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=simpleDateFormat.format(date);
        Date logoutTime=simpleDateFormat.parse(nowTime);

        adminLog.setLogoutTime(logoutTime);

        adminService.updateAdminLog(adminLog);

        session.invalidate();
        modelAndView.setViewName("redirect:/index.jsp");
        return modelAndView;
    }

    @RequestMapping("/allmain")
    public String index()
    {

        return "redirect:/admin/toallmain";
    }
    @RequestMapping("/toallmain")
    public String toallmain(ModelAndView modelAndView)
    {
        return "/jsp/allmain";
    }

    @RequestMapping("/main")
    public String getMain()
    {
        return "/jsp/main";
    }
    @RequestMapping("/adminList")
    public String adminList()
    {
        return "/jsp/admin/adminList";
    }
    @RequestMapping("/addAdmin")
    public String addAdmin(HttpSession session)
    {
        List<Role> roles=adminService.getRoles();
        session.setAttribute("roles",roles);
        return "/jsp/admin/addAdmin";
    }
    @RequestMapping("/roleList")
    public String roleList()
    {
        return "/jsp/role/roleList";
    }

    @RequestMapping("/editRole")
    public String editRole(Role role, Model model)
    {
        role=adminService.getRoleById(role.getRoleId());
        model.addAttribute("role",role);
        return "/jsp/role/editRole";
    }
    @RequestMapping("/addRole")
    public String addRole()
    {
        return "/jsp/role/addRole";
    }

    @RequestMapping("/menuList")
    public String menuList()
    {
        return "/jsp/menu/menuList";
    }

    @RequestMapping("/changePassword")
    public String changePassword()
    {
        return "/jsp/admin/changePassword";
    }
    @RequestMapping("/adminLoginLog")
    public String adminLoginLog()
    {
        return "/jsp/admin/adminLogList";
    }
    @RequestMapping("/register")
    public String register()
    {
        return "/jsp/register/register";
    }

    @RequestMapping("/reservationDoneList")
    public String reservationDoneList()
    {
        return "/jsp/admin/reservationDoneList";
    }

    @RequestMapping("/getReservationDoneList")
    @ResponseBody
    public ResultUtil getReservationDoneList(Integer page,Integer limit)
    {
        return reservationService.getReservationDoneList(page,limit);
    }


    @RequestMapping("/commentList")
    public String commentList()
    {
        return "/jsp/comment/commentList";
    }

    @RequestMapping("/getCommentList")
    @ResponseBody
    public ResultUtil getCommentList(Integer page,Integer limit)
    {
        return commentService.getCommentList(page,limit);

    }

    @RequestMapping("/deleteComment/{comment_id}")
    @ResponseBody
    public ResultUtil deleteComment(@PathVariable("comment_id") Integer comment_id)
    {
        try
        {
            commentService.deleteComment(comment_id);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }


    @RequestMapping("/reservationList")
    public String reservationList()
    {
        return "/jsp/admin/reservationList";
    }

    @RequestMapping("/getReservationList")
    @ResponseBody
    public ResultUtil getReservationList(Integer page,Integer limit)
    {
        return reservationService.getReservationList(page,limit);
    }


    @RequestMapping("/check_out/{room_info_id}/{reservation_id}")
    @ResponseBody
    public ResultUtil check_out(@PathVariable("room_info_id") Integer room_info_id,
                                @PathVariable("reservation_id") Integer reservation_id)
    {
       // System.out.println(room_info_id);
        try
        {
            RoomInfo roomInfo=roomInfoDao.getRoomById(room_info_id);
            roomInfo.setStatus(0); //表示房间已退房 空闲状态
            roomInfoDao.updRoom(roomInfo);
            Reservation reservation=reservationService.getReservationById(reservation_id);
            reservation.setStatus(1); //表示预定订单 变成历史订单
            reservationService.updateReservation(reservation);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }
    @RequestMapping("/check_in/{room_info_id}")
    @ResponseBody
    public ResultUtil check_in(@PathVariable("room_info_id") Integer room_info_id)
    {
        // System.out.println(room_info_id);
        try
        {
            RoomInfo roomInfo=roomInfoDao.getRoomById(room_info_id);
            roomInfo.setStatus(2); //表示房间已入住状态
            roomInfoDao.updRoom(roomInfo);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

}
