package com.entity;

public class Comiclist {
    private int id;
    private String comictype;

    public Comiclist() {
    }

    public Comiclist(int id, String comictype) {
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
        return "Comiclist{" +
                "id=" + id +
                ", comictype='" + comictype + '\'' +
                '}';
    }
}
