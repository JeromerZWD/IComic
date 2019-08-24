package com.mapper;

import com.entity.Comic;
import org.apache.ibatis.annotations.Options;

import java.util.List;

public interface ComicMapper {
    //查询所有漫画
    List<Comic> getComics();
    //通过漫画名或作者或状态或地区 查询漫画
    List<Comic> getComicSByOther(Comic comic);
    //通过漫画id 查询漫画
    Comic getComicById(int id);
    //通过id删除漫画
    int deleteComicById(int id);
    //新增漫画
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    int addComic(Comic comic);
    //插入漫画类型的关联表
    int insertComicList(int comicid,List<Integer> clids);
    //通过漫画类型id 查询漫画
    List<Comic> getComicByTypeId(int comiclistid);
}
