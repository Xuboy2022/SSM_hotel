package com.mecol.hotel.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mecol.hotel.dao.ReservationDao;
import com.mecol.hotel.dao.RoomInfoDao;
import com.mecol.hotel.entity.Reservation;
import com.mecol.hotel.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;

@Service
@Transactional

public class ReservationServiceImpl implements ReservationService
{
    @Autowired
    private ReservationDao reservationDao;


    @Override
    public void insReservation(Reservation reservation)
    {
        reservationDao.insReservation(reservation);

    }

    @Override
    public ResultUtil getReservationList(Integer page, Integer limit)
    {
        PageHelper.startPage(page,limit);
        List<Reservation> reservationList=reservationDao.getReservationList();
        PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservationList);


        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setData(reservationPageInfo.getList());
        resultUtil.setCount(reservationPageInfo.getTotal());
        return resultUtil;
    }

    @Override
    public ResultUtil getReservationDoneList(Integer page, Integer limit) {
        PageHelper.startPage(page,limit);
        List<Reservation> reservationList=reservationDao.getReservationDoneList();
        PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservationList);

        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setData(reservationPageInfo.getList());
        resultUtil.setCount(reservationPageInfo.getTotal());
        return resultUtil;
    }

    @Override
    public Reservation getReservationById(Integer reservation_id) {
        return reservationDao.getReservationById(reservation_id);
    }

    @Override
    public void updateReservation(Reservation reservation) {
            reservationDao.updateReservation(reservation);
    }

    @Override
    public ResultUtil getReservationOldList(Integer page, Integer limit,Integer user_id) {
        PageHelper.startPage(page,limit);
        List<Reservation> reservationList=reservationDao.getReservationOldList(user_id);
        PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservationList);

        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setData(reservationPageInfo.getList());
        resultUtil.setCount(reservationPageInfo.getTotal());
        return resultUtil;
    }

    @Override
    public ResultUtil getReservationNowList(Integer page, Integer limit, Integer user_id) {
        PageHelper.startPage(page,limit);
        List<Reservation> reservationList=reservationDao.getReservationNowList(user_id);
        PageInfo<Reservation> reservationPageInfo=new PageInfo<>(reservationList);

        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setData(reservationPageInfo.getList());
        resultUtil.setCount(reservationPageInfo.getTotal());
        return resultUtil;
    }

    @Override
    public void deleteReservation(Integer user_id, Integer room_info_id) {
        reservationDao.deleteReservation(user_id,room_info_id);
    }

}
