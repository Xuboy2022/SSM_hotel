package com.mecol.hotel.service;

import com.mecol.hotel.entity.Reservation;
import com.mecol.hotel.util.ResultUtil;

public interface ReservationService {
    void insReservation(Reservation reservation);

    ResultUtil getReservationList(Integer page, Integer limit);

    ResultUtil getReservationDoneList(Integer page, Integer limit);

    Reservation getReservationById(Integer reservation_id);

    void updateReservation(Reservation reservation);


    ResultUtil getReservationOldList(Integer page, Integer limit, Integer user_id);

    ResultUtil getReservationNowList(Integer page, Integer limit, Integer user_id);

    void deleteReservation(Integer user_id, Integer room_info_id);
}
