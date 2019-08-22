package com.service.impl;

import com.entity.Comic;
import com.mapper.ComicMapper;
import com.service.ComicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public int addComic(Comic comic) {
        return comicMapper.addComic(comic);
    }
}
