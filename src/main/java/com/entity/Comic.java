package com.entity;

import java.util.Arrays;

public class Comic {
    private int id;
    private String comicname;
    private String author;
    private String introduction;
    private String code;
    private Comiclist[] comictype;
    private String area;
    private String updatetime;
    private String photopath;
    private double score;
    private int heat;

    public Comic() {
    }

    public Comic(int id, String comicname, String author, String introduction, String code, Comiclist[] comictype, String area, String updatetime, String photopath, double score, int heat) {
        this.id = id;
        this.comicname = comicname;
        this.author = author;
        this.introduction = introduction;
        this.code = code;
        this.comictype = comictype;
        this.area = area;
        this.updatetime = updatetime;
        this.photopath = photopath;
        this.score = score;
        this.heat = heat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComicname() {
        return comicname;
    }

    public void setComicname(String comicname) {
        this.comicname = comicname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Comiclist[] getComictype() {
        return comictype;
    }

    public void setComictype(Comiclist[] comictype) {
        this.comictype = comictype;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getPhotopath() {
        return photopath;
    }

    public void setPhotopath(String photopath) {
        this.photopath = photopath;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public int getHeat() {
        return heat;
    }

    public void setHeat(int heat) {
        this.heat = heat;
    }

    @Override
    public String toString() {
        return "Comic{" +
                "id=" + id +
                ", comicname='" + comicname + '\'' +
                ", author='" + author + '\'' +
                ", introduction='" + introduction + '\'' +
                ", code='" + code + '\'' +
                ", comictype=" + Arrays.toString(comictype) +
                ", area='" + area + '\'' +
                ", updatetime='" + updatetime + '\'' +
                ", photopath='" + photopath + '\'' +
                ", score=" + score +
                ", heat=" + heat +
                '}';
    }
}
