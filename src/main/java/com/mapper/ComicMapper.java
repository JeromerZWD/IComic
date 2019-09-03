package com.mapper;

import com.entity.Chapter;
import com.entity.Comic;
import com.entity.ComicList;
import com.entity.HaveList;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

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
    int addComic(Comic comic);
    //插入漫画类型的关联表
    int insertComicList(HaveList haveList);
    //通过漫画类型id 查询漫画
    List<Comic> getComicByTypeId(int comiclistid);
    //添加章节
    int addChapter(Chapter chapter);
    //删除章节通过章节id
    int deleteChapterById(int id);
    //通过章节数查找章节
    List<Chapter> getChapterByNumber(Chapter chapter);
    //通过漫画id 获取章节信息
    List<Chapter> getChaptersByComicId(int comicid);
    //修改注册时间 通过添加漫画章节实现的
    int updateTime(Comic comic);
    //通过漫画id删除 漫画所有的类型
    int deleteTypeById(int comicid);
    //热度+1 通过id
    int addHeat(int comicid);
    //通过漫画id查询 类型列表
    List<ComicList> getComicList(int comicid);
    //查询所有章节
    List<Chapter> getChapter();
    //相似推荐
    List<Comic> getLikeComic(int comicid);
    //获取热度总数、
    int getHeats();
    //通过漫画名字模糊查询
    List<Comic> getComicByLikeName(String comicname);
}
