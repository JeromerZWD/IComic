package com.entity;

public class HaveList {
    private int id;
    private Comic comic;
    private ComicList comicList;

    public HaveList() {
    }

    public HaveList(int id, Comic comic, ComicList comicList) {
        this.id = id;
        this.comic = comic;
        this.comicList = comicList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Comic getComic() {
        return comic;
    }

    public void setComic(Comic comic) {
        this.comic = comic;
    }

    public ComicList getComicList() {
        return comicList;
    }

    public void setComicList(ComicList comicList) {
        this.comicList = comicList;
    }

    @Override
    public String toString() {
        return "HaveList{" +
                "id=" + id +
                ", comic=" + comic +
                ", comicList=" + comicList +
                '}';
    }
}
