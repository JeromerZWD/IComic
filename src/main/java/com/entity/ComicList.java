package com.entity;

import java.util.ArrayList;
import java.util.List;

public class ComicList {
    private int id;
    private String comictype;
    private List<Comic> comics=new ArrayList<>();

    public ComicList() {
    }

    public ComicList(int id, String comictype, List<Comic> comics) {
        this.id = id;
        this.comictype = comictype;
        this.comics = comics;
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

    public List<Comic> getComics() {
        return comics;
    }

    public void setComics(List<Comic> comics) {
        this.comics = comics;
    }

    @Override
    public String toString() {
        return "ComicList{" +
                "id=" + id +
                ", comictype='" + comictype + '\'' +
                ", comics=" + comics +
                '}';
    }
}
