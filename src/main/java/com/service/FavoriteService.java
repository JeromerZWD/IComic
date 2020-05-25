package com.service;

import com.entity.Favorite;

import java.util.List;

public interface FavoriteService {
    /**
     * 添加收藏
     */
    int addFavorite(Favorite favorite);

    /**
     * 取消收藏
     */
    int removeFavorite(Favorite favorite);

    /**
     *查询收藏漫画
     */
    List<Favorite> getFavorites(Favorite favorite);

}
