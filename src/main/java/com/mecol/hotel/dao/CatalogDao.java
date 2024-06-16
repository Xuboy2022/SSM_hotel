package com.mecol.hotel.dao;

import com.mecol.hotel.entity.RoomCatalog;

import java.util.List;

public interface CatalogDao {
    List<RoomCatalog> getCatalogList();

    RoomCatalog getCatalogById(Integer room_catalog_id);

    RoomCatalog getCatalogByCatalogName(String catalog);

    void updateCatalog(RoomCatalog roomCatalog);

    void delCatalogById(Integer room_catalog_id);

    void addCatalog(RoomCatalog roomCatalog);

}
