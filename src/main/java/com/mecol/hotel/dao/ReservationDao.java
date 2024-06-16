package com.mecol.hotel.dao;

import com.mecol.hotel.entity.Reservation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReservationDao {
    void insReservation(Reservation reservation);

    List<Reservation> getReservationList();

    List<Reservation> getReservationDoneList();

    Reservation getReservationById(Integer reservation_id);

    void updateReservation(Reservation reservation);

    List<Reservation> getReservationOldList(Integer user_id);

    List<Reservation> getReservationNowList(Integer user_id);

    void deleteReservation(@Param("user_id") Integer user_id, @Param("room_info_id") Integer room_info_id);
}
