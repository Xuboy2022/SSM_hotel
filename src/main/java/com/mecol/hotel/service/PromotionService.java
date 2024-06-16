package com.mecol.hotel.service;

import com.mecol.hotel.entity.Promotion;
import com.mecol.hotel.util.ResultUtil;

public interface PromotionService {
    ResultUtil getPromotionList(Integer page, Integer limit);

    void insPromotion(Promotion promotion);

    void delPromotionById(Integer promotion_id);
}
