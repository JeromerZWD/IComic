package com.service;

import com.entity.Comic;

import java.util.List;

public interface ComicService {
    //查询所有漫画（按更新时间排序）
    List<Comic> getComics();
    //通过漫画名或作者或状态或地区 查询漫画
    List<Comic> getComicSByOther(Comic comic);
    //通过漫画id 查询漫画
    Comic getComicById(int id);
    //通过id删除漫画
    int deleteComicById(int id);
    //新增漫画
    int addComic(Comic comic);
}
