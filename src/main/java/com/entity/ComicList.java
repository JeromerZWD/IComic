package com.entity;

import java.util.List;

public class ComicList {
    private int id;
    private String comictype;
    public ComicList() {
    }

    public ComicList(int id, String comictype) {
        this.id = id;
        this.comictype = comictype;

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

    @Override
    public String toString() {
        return "ComicList{" +
                "id=" + id +
                ", comictype='" + comictype + '\'' +
                '}';
    }
}
