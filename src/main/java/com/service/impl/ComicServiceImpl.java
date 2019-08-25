package com.service.impl;

import com.entity.Comic;
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
        return comicMapper.getComics();
    }

    @Override
    public List<Comic> getComicSByOther(Comic comic) {
        return comicMapper.getComicSByOther(comic);
    }

    @Override
    public Comic getComicById(int id) {
        return comicMapper.getComicById(id);
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
        return comicMapper.getComicByTypeId(comiclistid);
    }
}
