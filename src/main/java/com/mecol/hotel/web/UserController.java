package com.mecol.hotel.web;

import com.mecol.hotel.entity.*;
import com.mecol.hotel.service.CommentService;
import com.mecol.hotel.service.ReservationService;
import com.mecol.hotel.service.RoomService;
import com.mecol.hotel.service.UserService;
import com.mecol.hotel.util.EncryptUtil;
import com.mecol.hotel.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController
{

    @Autowired
    private UserService userService;
    @Autowired
    private RoomService roomService;

    @Autowired
    private ReservationService reservationService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/login")
    @ResponseBody
    public ResultUtil login(String username, String password, HttpServletRequest request, HttpSession session)
    {
        User user=userService.login(username,EncryptUtil.encrypt(password));

        if(user!=null)
        {
            Integer status=user.getStatus();
            if(status==0)
            {
                 return ResultUtil.error("对不起，此用户被禁用，请联系超级管理员");
            }
            Admin admin=new Admin();
            session.setAttribute("user",admin); //拦截器中用 跳过拦截器
            session.setAttribute("hotel_user",user);
            session.setAttribute("usertype",2);//代表会员登陆
            session.setAttribute("hotel_user_id",user.getUser_id());
            session.setAttribute("hotel_user_photo",user.getPhoto_path());//获得头像图片名
            return ResultUtil.ok();
        }
        else
        {
            return ResultUtil.error("用户名或者密码错误，请重新输入");
        }

    }

    @RequestMapping("/getMenus")
    @ResponseBody
    public List<Menu> getMenus(HttpSession session)
    {
        //System.out.println("学生获取菜单进来了");
        List<Menu> menus=null;
        User user= (User) session.getAttribute("hotel_user");
        User user1=userService.getUserById(user.getUser_id());
        if(user1!=null)
        {
            menus=userService.getMenus(user1);
        }
        return menus;
    }

    @RequestMapping("/logOut")
    public ModelAndView logOut(ModelAndView modelAndView, HttpSession session)
    {
        session.invalidate();
        modelAndView.setViewName("redirect:/index.jsp");
        return modelAndView;
    }


    @RequestMapping("/info")
    public String info(HttpSession session)
    {
        //覆盖一下之前的hotel_user 不然显示的还是之前的hotel_user
        Integer user_id= (Integer) session.getAttribute("hotel_user_id");
        User user=userService.getUserById(user_id);
        session.setAttribute("hotel_user",user);
        return "/jsp/user/editUser";
    }
    @RequestMapping("/updateUser")
    @ResponseBody
    public ResultUtil updateUser(User user)throws ParseException
    {
        //System.out.println("曹操。。。。。。");

        return userService.updateUser(user);
    }

    @RequestMapping("/changePassword")
    public  String changePassword()
    {
        return "/jsp/user/changePassword";
    }
    @RequestMapping("/changeUserPassword")
    @ResponseBody
    public ResultUtil changeStudentPassword(String oldPassword,String newPassword1,String username)
    {
        User user=userService.getUsertByUserName(username);
        if(user!=null)
        {
            if(user.getPassword().equals(EncryptUtil.encrypt(oldPassword)))
            {
                user.setPassword(EncryptUtil.encrypt(newPassword1));
                userService.updateUser(user);
                return ResultUtil.ok();
            }
            else
            {
                return ResultUtil.error("旧密码错误，请重新填写");
            }
        }
        return ResultUtil.error("请求出错！！");

    }

    @RequestMapping("/newUser")
    @ResponseBody
    public  ResultUtil newUser(User user)
    {
      //  System.out.println("新会员注册");
     //   System.out.println(user);
        try
        {
            user.setStatus(1); //1表示正常
            user.setRoleId((long) 3); //角色里表示一般会员
            user.setPassword(EncryptUtil.encrypt(user.getPassword()));
            Date date=new Date();
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String nowTime=simpleDateFormat.format(date);
            Date create_time=simpleDateFormat.parse(nowTime);

            user.setCreate_time(create_time);
            userService.insUser(user);
            return ResultUtil.ok();

        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }

    }


    //下面是会员注册的时候 上传的头像
    @RequestMapping(value = "/image", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> image(@RequestParam(value = "file") MultipartFile file, HttpServletRequest request, HttpServletResponse response)
    {

        Map<String, Object> map2 = new HashMap<String, Object>();
        Map<String, Object> map = new HashMap<String, Object>();
        String filename = "";
        //我们采用配置虚拟路径的方法 这样就不用刷新了
        //因为前段 http://localhost:8080/img/1585500744952646d4344fc4aa7de8bad486dae5.jpeg
        //所以 配置的时候img对应的application context 为 /img
        String localPath = "D:\\img\\"; //存放我们上传的头像
     //   String localPath="F:\\idea pro\\ssm_mysql_hotel\\src\\main\\webapp\\img\\";
        try {
            if (file != null) {
                //生成uuid作为文件名称
                String uuid = UUID.randomUUID().toString().replaceAll("-", "");
                //获得文件类型（可以判断如果不是图片，禁止上传）
                String contentType = file.getContentType();
                //获得文件后缀名
                String suffixName = contentType.substring(contentType.indexOf("/") + 1);
                //得到 文件名(随机数+uuid+后缀)
                filename = (int)((Math.random())*100000000)+uuid + "." + suffixName;

//            判断是否有这个文件夹，没有就创建
                if (!new File(localPath).exists()) {

                    new File(localPath).mkdirs();
                }
//            复制到当前文件夹
                file.transferTo(new File(localPath + filename));


            }
        } catch (Exception e) {


            map.put("code", 1);
            map.put("msg", "");
            map.put("data", map2);
            map2.put("src", filename);
          //  System.out.println("上传失败");
            return map;

        }

        map.put("code", 0);
        map.put("msg", "");
        map.put("data", map2);
        map2.put("src", filename);
       // System.out.println("上传成功:"+filename);
        return map;
    }

    @RequestMapping("/roomList")
    public String roomList()
    {
        return "/jsp/user/roomList";
    }
    @RequestMapping("/reservation/{room_num}/{room_info_id}")
    public String reservation(@PathVariable("room_num") String room_num,@PathVariable Integer room_info_id,
                              HttpSession session)
    {
        session.setAttribute("room_num",room_num);
        session.setAttribute("room_info_id",room_info_id);
        return "/jsp/user/reservation";
    }
    @RequestMapping("/insReservation")
    @ResponseBody
    public ResultUtil insReservation(Reservation reservation)
    {
       // System.out.println(reservation);
        Integer room_info_id=reservation.getRoom_info_id();
        RoomInfo roomInfo=roomService.getRoomById(room_info_id);
        Integer status=roomInfo.getStatus();
        if(status==0)
        {
            try {
                Date date = new Date();
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String nowTime = simpleDateFormat.format(date);
                Date order_time = simpleDateFormat.parse(nowTime);
                roomInfo.setStatus(1); //设置为已预订
                roomService.updRoom(roomInfo);

                reservation.setOrder_time(order_time);
                reservation.setStatus(0); //0表示是预定状态 1表示退房后成为历史订单
                reservationService.insReservation(reservation);
                return ResultUtil.ok("预订成功");
            }
            catch (Exception e)
            {
                e.printStackTrace();
                return ResultUtil.error("检查sql等");
            }

        }
        else
        {
            return ResultUtil.error("对不起，房间已被预订或已入住");
        }

    }

    @RequestMapping("/comments/{room_info_id}")
    public String comment(@PathVariable Integer room_info_id,
                          HttpSession session) throws ParseException {
        List<Comment> commentList=commentService.selectCommentByRoom_info_id(room_info_id);
      //  System.out.println(commentList);
        session.setAttribute("commentList",commentList);
        return "/jsp/comment/comment";
    }

    @RequestMapping("/addComment/{room_info_id}")
    public String addComment(@PathVariable Integer room_info_id,
                          HttpSession session) throws ParseException
    {
        RoomInfo roomInfo=roomService.getRoomById(room_info_id);
        Integer user_id= (Integer) session.getAttribute("hotel_user_id");
        session.setAttribute("user_id",user_id);
        session.setAttribute("roomInfo",roomInfo);
        return "/jsp/comment/addComment";
    }

    @RequestMapping("/insComment")
    @ResponseBody
    public ResultUtil insComment(Comment comment)
    {
     //   System.out.println(comment);

       try {
           Date date = new Date();
           SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
           String nowTime = simpleDateFormat.format(date);
           Date pub_date = simpleDateFormat.parse(nowTime);
           comment.setPub_date(pub_date);
           commentService.insComment(comment);
           return ResultUtil.ok();
       }
       catch (Exception e)
       {
           e.printStackTrace();
           return ResultUtil.error();
       }

    }



    //历史订单
    @RequestMapping("/orderList")
    public String orderList()
    {
        return "/jsp/user/orderList";
    }
    @RequestMapping("/getOrderList")
    @ResponseBody
    public ResultUtil getOrderList(Integer page,Integer limit,HttpSession session)
    {
        //获取历史订单
        Integer user_id= (Integer) session.getAttribute("hotel_user_id");
        return reservationService.getReservationOldList(page,limit,user_id);
    }

    //预定的订单
    @RequestMapping("/nowOrderList")
    public String nowOrderList()
    {
        return "/jsp/user/nowOrderList";
    }

    @RequestMapping("/getNowOrderList")
    @ResponseBody
    public ResultUtil getNowOrderList(Integer page,Integer limit,HttpSession session)
    {
        //获取历史订单
        Integer user_id= (Integer) session.getAttribute("hotel_user_id");
        return reservationService.getReservationNowList(page,limit,user_id);
    }

    @RequestMapping("/cancel/{room_info_id}")
    @ResponseBody
    public ResultUtil cancel(@PathVariable Integer room_info_id,
                          HttpSession session) throws ParseException {
            try
            {
                Integer user_id= (Integer) session.getAttribute("hotel_user_id");

                RoomInfo roomInfo=roomService.getRoomById(room_info_id);
                roomInfo.setStatus(0); //设置为空闲状态
                roomService.updRoom(roomInfo);
                reservationService.deleteReservation(user_id,room_info_id);
                return ResultUtil.ok();
            }
            catch (Exception e)
            {
                e.printStackTrace();
                return ResultUtil.error();
            }
    }

}
