package com.entity;

import java.util.Date;

/**
 * @author zwd
 * @desc
 * @date 2019/12/31 14:53
 */
public class Favorite {
    private Integer id;
    private Integer userId;
    private Integer comicId;
    private Date favoriteTime;
    private Comic comic;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getComicId() {
        return comicId;
    }

    public void setComicId(Integer comicId) {
        this.comicId = comicId;
    }

    public Date getFavoriteTime() {
        return favoriteTime;
    }

    public void setFavoriteTime(Date favoriteTime) {
        this.favoriteTime = favoriteTime;
    }

    public Comic getComic() {
        return comic;
    }

    public void setComic(Comic comic) {
        this.comic = comic;
    }
}
