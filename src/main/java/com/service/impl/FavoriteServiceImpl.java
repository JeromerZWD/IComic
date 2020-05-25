package com.service.impl;

import com.entity.Favorite;
import com.mapper.FavoriteMapper;
import com.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author zwd
 * @desc
 * @date 2019/12/31 14:58
 */
@Service
public class FavoriteServiceImpl implements FavoriteService {
    @Autowired
    FavoriteMapper favoriteMapper;

    @Override
    public int addFavorite(Favorite favorite) {
        favorite.setFavoriteTime(new Date());
        return favoriteMapper.addFavorite(favorite);
    }

    @Override
    public int removeFavorite(Favorite favorite) {
        return favoriteMapper.removeFavorite(favorite);
    }


    @Override
    public List<Favorite> getFavorites(Favorite favorite) {
        return favoriteMapper.getFavorites(favorite);
    }
}
