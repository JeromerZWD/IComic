package com.entity;

import java.util.List;

public class ComicList {
    private int id;
    private String comictype;
    private  Comic comic;
    public ComicList() {
    }

    public ComicList(int id, String comictype,Comic comic) {
        this.id = id;
        this.comictype = comictype;
        this.comic=comic;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComictype() {
        return comictype;
    }

    public void setComictype(String comictype) {
        this.comictype = comictype;
    }

    public Comic getComic() {
        return comic;
    }

    public void setComic(Comic comic) {
        this.comic = comic;
    }

    @Override
    public String toString() {
        return "ComicList{" +
                "id=" + id +
                ", comictype='" + comictype + '\'' +
                ", comic=" + comic +
                '}';
    }
}
