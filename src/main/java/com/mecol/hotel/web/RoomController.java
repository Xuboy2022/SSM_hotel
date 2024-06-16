package com.mecol.hotel.web;

import com.mecol.hotel.entity.RoomCatalog;
import com.mecol.hotel.entity.RoomInfo;
import com.mecol.hotel.entity.RoomSearch;
import com.mecol.hotel.service.RoomService;
import com.mecol.hotel.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController
{
    @Autowired
    private RoomService roomService;

    @RequestMapping("/roomList")
    public String roomList()
    {
        return "/jsp/room/roomList";
    }

    @RequestMapping("/Catalog")
    public String catalog()
    {
        return "/jsp/room/roomCatalog";
    }

    @RequestMapping("/addCatalog")
    public String  addCatalog()
    {
        return "/jsp/room/addCatalog";
    }


    @RequestMapping("/insCatalog")
    @ResponseBody
    public ResultUtil addCatalog(RoomCatalog roomCatalog)
    {
        roomService.addCatalog(roomCatalog);
        return ResultUtil.ok();
    }


    @RequestMapping("/getCatalogList")
    @ResponseBody
    public ResultUtil getCatalogList(Integer page,Integer limit)
    {
        return roomService.getCatalogList(page,limit);
    }

    @RequestMapping("/editCatalog/{room_catalog_id}")
    public String editCatalog(@PathVariable("room_catalog_id") Integer room_catalog_id, Model model)
    {
        RoomCatalog roomCatalog=roomService.getCatalogById(room_catalog_id);
        model.addAttribute("catalog",roomCatalog);
        return "/jsp/room/editCatalog";
    }

    // 检查角色是否唯一 添加新角色的时候用这个函数
    @RequestMapping("/checkCatalogName/{catalog}")
    @ResponseBody
    public ResultUtil checkRoleName(@PathVariable("catalog") String catalog)
    {
        RoomCatalog roomCatalog=roomService.getCatalogByCatalogName(catalog);
        if(roomCatalog==null)//没有这个角色名 可以
        {
            return new ResultUtil(0);
        }
        else  //此角色名已存在
        {
            return new ResultUtil(500,"已经存在此房间类别名称");
        }
    }



    @RequestMapping("/updateCatalog")
    @ResponseBody
    public void updateCatalog(RoomCatalog roomCatalog)
    {

            roomService.updateCatalog(roomCatalog);

    }
    @RequestMapping("/delCatalogById/{room_catalog_id}")
    @ResponseBody
    public ResultUtil delCatalogById(@PathVariable("room_catalog_id")Integer room_catalog_id)
    {

        roomService.delCatalogById(room_catalog_id);
        return ResultUtil.ok();
    }

    @RequestMapping("/addRoom")
    public String addRoom(HttpSession session)
    {
        List<RoomCatalog> roomCatalogs=roomService.getAllCatalogs();
        session.setAttribute("catalog",roomCatalogs);
        return "/jsp/room/addRoom";
    }

    @RequestMapping("/checkRoomNum/{roomNum}")
    @ResponseBody
    public ResultUtil checkRoomNum(@PathVariable("roomNum") String roomNum)
    {
        RoomInfo  roomInfo=roomService.getRoomByNum(roomNum);
        if(roomInfo==null)//没有这个房间号 可以
        {
            return new ResultUtil(0);
        }
        else  //此角色名已存在
        {
            return new ResultUtil(500,"已经存在此房间号");
        }
    }

    @RequestMapping("/insRoom")
    @ResponseBody
    public ResultUtil insRoom(RoomInfo roomInfo)
    {
        roomService.insRoom(roomInfo);
        return ResultUtil.ok();
    }

    @RequestMapping("/getRoomList")
    @ResponseBody
    public ResultUtil getRoomList(Integer page,Integer limit)
    {
        return roomService.getRoomList(page,limit);
    }

    //************************

    @RequestMapping("/getRoomListSearch")
    @ResponseBody
    public ResultUtil getRoomListSearch(Integer page, Integer limit, RoomSearch roomSearch)
    {
        return roomService.getRoomListSearch(page,limit,roomSearch);
    }
    //************************


    @RequestMapping("/editRoom/{room_info_id}")
    public String editRoom(@PathVariable("room_info_id") Integer room_info_id, Model model)
    {
        RoomInfo roomInfo=roomService.getRoomById(room_info_id);
        List<RoomCatalog> roomCatalogs=roomService.getAllCatalogs();
        model.addAttribute("roomInfo",roomInfo);
        model.addAttribute("roomCatalogs",roomCatalogs);
        return "/jsp/room/editRoom";
    }
    @RequestMapping("/updRoom")
    @ResponseBody
    public ResultUtil updRoom(RoomInfo roomInfo)
    {
        try
        {
            roomService.updRoom(roomInfo);
            return ResultUtil.ok();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

    @RequestMapping("/delRoomById/{room_info_id}")
    @ResponseBody
    public ResultUtil delRoomById(@PathVariable("room_info_id")Integer room_info_id)
    {

        roomService.delRoomById(room_info_id);
        return ResultUtil.ok();
    }


}
