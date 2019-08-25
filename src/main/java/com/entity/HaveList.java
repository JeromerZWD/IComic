package com.entity;

import java.util.List;

public class HaveList {
    private int id;
    private int comicid;
    private int comiclistid;

    public HaveList() {
    }

    public HaveList(int comicid, int comiclistid) {
        this.comicid = comicid;
        this.comiclistid = comiclistid;
    }

    public HaveList(int id, int comicid, int comiclistid) {
        this.id = id;
        this.comicid = comicid;
        this.comiclistid = comiclistid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getComicid() {
        return comicid;
    }

    public void setComicid(int comicid) {
        this.comicid = comicid;
    }

    public int getComiclistid() {
        return comiclistid;
    }

    public void setComiclistid(int comiclistid) {
        this.comiclistid = comiclistid;
    }

    @Override
    public String toString() {
        return "HaveList{" +
                "id=" + id +
                ", comicid=" + comicid +
                ", comiclistid=" + comiclistid +
                '}';
    }
}
