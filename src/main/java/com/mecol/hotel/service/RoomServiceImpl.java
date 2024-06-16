package com.mecol.hotel.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mecol.hotel.dao.CatalogDao;
import com.mecol.hotel.dao.RoomInfoDao;
import com.mecol.hotel.entity.RoomCatalog;
import com.mecol.hotel.entity.RoomInfo;
import com.mecol.hotel.entity.RoomSearch;
import com.mecol.hotel.entity.User;
import com.mecol.hotel.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoomServiceImpl implements RoomService
{
    @Autowired
    private CatalogDao catalogDao;
    @Autowired
    private RoomInfoDao roomInfoDao;

    @Override
    public ResultUtil getCatalogList(Integer page, Integer limit)
    {
        PageHelper.startPage(page,limit);
        List<RoomCatalog> roomCatalogs=catalogDao.getCatalogList();
        PageInfo<RoomCatalog> roomCatalogPageInfo=new PageInfo<>(roomCatalogs);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(roomCatalogPageInfo.getTotal());
        resultUtil.setData(roomCatalogPageInfo.getList());
        return resultUtil;
    }

    @Override
    public RoomCatalog getCatalogById(Integer room_catalog_id) {
        return catalogDao.getCatalogById(room_catalog_id);
    }

    @Override
    public RoomCatalog getCatalogByCatalogName(String catalog) {
        return catalogDao.getCatalogByCatalogName(catalog);
    }

    @Override
    public void updateCatalog(RoomCatalog roomCatalog) {
        catalogDao.updateCatalog(roomCatalog);
    }

    @Override
    public void delCatalogById(Integer room_catalog_id) {
        catalogDao.delCatalogById(room_catalog_id);
    }

    @Override
    public void addCatalog(RoomCatalog roomCatalog) {
        catalogDao.addCatalog(roomCatalog);
    }

    @Override
    public List<RoomCatalog> getAllCatalogs() {
        return catalogDao.getCatalogList();
    }

    @Override
    public RoomInfo getRoomByNum(String roomNum) {
        return roomInfoDao.getRoomByNum(roomNum);
    }

    @Override
    public void insRoom(RoomInfo roomInfo) {
        roomInfoDao.insRoom(roomInfo);
    }


    //*************************

    @Override
    public ResultUtil getRoomListSearch(Integer page, Integer limit, RoomSearch roomSearch) {
        PageHelper.startPage(page,limit);
        List<RoomInfo> roomInfos=roomInfoDao.getRoomListSearch(roomSearch);
        PageInfo<RoomInfo> pageInfo=new PageInfo<>(roomInfos);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }
    //*************************
    @Override
    public ResultUtil getRoomList(Integer page, Integer limit) {
        PageHelper.startPage(page,limit);
        List<RoomInfo> roomInfos=roomInfoDao.getRoomList();
        PageInfo<RoomInfo> roomInfoPageInfo=new PageInfo<>(roomInfos);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setData(roomInfoPageInfo.getList());
        resultUtil.setCount(roomInfoPageInfo.getTotal());
        return resultUtil;
    }



    @Override
    public RoomInfo getRoomById(Integer room_info_id) {
        return roomInfoDao.getRoomById(room_info_id);
    }

    @Override
    public void updRoom(RoomInfo roomInfo) {
        roomInfoDao.updRoom(roomInfo);
    }

    @Override
    public void delRoomById(Integer room_info_id) {
        roomInfoDao.delRoomById(room_info_id);
    }






}
