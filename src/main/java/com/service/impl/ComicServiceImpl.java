package com.service.impl;

import com.entity.Chapter;
import com.entity.Comic;
import com.entity.ComicList;
import com.entity.HaveList;
import com.mapper.ComicMapper;
import com.service.ComicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
@Service
public class ComicServiceImpl implements ComicService {
    @Autowired
    private ComicMapper comicMapper;
    @Override
    public List<Comic> getComics() {
        List<Comic> list= comicMapper.getComics();
        for (Comic c:list) {
            String S="";
            List<ComicList> list1=comicMapper.getComicList(c.getId());
            for (int i=0;i<list1.size();i++){
                String s=list1.get(i).getComictype();
                S=S+s;
                if (i<list1.size()-1){
                    S=S+"/";
                }
            }
            c.setComicListsString(S);
        }
        return list;
    }

    @Override
    public List<Comic> getComicSByOther(Comic comic) {
        List<Comic> list= comicMapper.getComicSByOther(comic);
        for (Comic c:list) {
            String S="";
            List<ComicList> list1=comicMapper.getComicList(c.getId());
            for (int i=0;i<list1.size();i++){
                String s=list1.get(i).getComictype();
                S=S+s;
                if (i<list1.size()-1){
                    S=S+"/";
                }
            }
            c.setComicListsString(S);
        }
        return list;
    }

    @Override
    public Comic getComicById(int id) {
        Comic c=comicMapper.getComicById(id);
        String S="";
        List<ComicList> list1=comicMapper.getComicList(c.getId());
        for (int i=0;i<list1.size();i++){
            String s=list1.get(i).getComictype();
            S=S+s;
            if (i<list1.size()-1){
                S=S+"/";
            }
        }
        c.setComicListsString(S);
        return c;
    }

    @Override
    public int deleteComicById(int id) {
        return comicMapper.deleteComicById(id);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public int addComic(Comic comic) {
        int i=comicMapper.addComic(comic);
        int comicid=comic.getId();
        int[] clids=comic.getClids();
        System.out.println(clids);
        for (int comiclistid:clids) {
            comicMapper.insertComicList(new HaveList(comicid,comiclistid));
        }
        return i;
    }

    @Override
    public List<Comic> getComicByTypeId(int comiclistid) {
        List<Comic> list=comicMapper.getComicByTypeId(comiclistid);
        for (Comic c:list) {
            String S="";
            List<ComicList> list1=comicMapper.getComicList(c.getId());
            for (int i=0;i<list1.size();i++){
                String s=list1.get(i).getComictype();
                S=S+s;
                if (i<list1.size()-1){
                    S=S+"/";
                }
            }
            c.setComicListsString(S);
        }
        return list;
    }

    @Override
    public int addChapter(Chapter chapter) {
        return comicMapper.addChapter(chapter);
    }

    @Override
    public int deleteChapterById(int id) {
        return comicMapper.deleteChapterById(id);
    }

    @Override
    public List<Chapter> getChapterByNumber(Chapter chapter) {
        return comicMapper.getChapterByNumber(chapter);
    }

    @Override
    public List<Chapter> getChaptersByComicId(int comicid) {
        return comicMapper.getChaptersByComicId(comicid);
    }

    @Override
    public int updateTime(Comic comic) {
        return comicMapper.updateTime(comic);
    }

    @Override
    public int deleteTypeById(int comicid) {
        return comicMapper.deleteTypeById(comicid);
    }

    @Override
    public int addHeat(int comicid) {
        return comicMapper.addHeat(comicid);
    }

    @Override
    public List<ComicList> getComicList(int comicid) {
        List<ComicList> lists=comicMapper.getComicList(comicid);
        return comicMapper.getComicList(comicid);
    }
}
