package com.entity;

import java.util.Arrays;
import java.util.List;

public class Comic {
    private int id;
    private String comicname;
    private String author;
    private String introduction;
    private String code;
    private String area;
    private String updatetime;
    private String photopath;
    private double score;
    private int heat;
    private List<ComicList> comicLists;
    private Integer[] clids;

    public Comic() {
    }

    public Comic(int id, String comicname, String author, String introduction, String code, String area, String updatetime, String photopath, double score, int heat, List<ComicList> comicLists, Integer[] clids) {
        this.id = id;
        this.comicname = comicname;
        this.author = author;
        this.introduction = introduction;
        this.code = code;
        this.area = area;
        this.updatetime = updatetime;
        this.photopath = photopath;
        this.score = score;
        this.heat = heat;
        this.comicLists = comicLists;
        this.clids = clids;
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

    public List<ComicList> getComicLists() {
        return comicLists;
    }

    public void setComicLists(List<ComicList> comicLists) {
        this.comicLists = comicLists;
    }

    public Integer[] getClids() {
        return clids;
    }

    public void setClids(Integer[] clids) {
        this.clids = clids;
    }

    @Override
    public String toString() {
        return "Comic{" +
                "id=" + id +
                ", comicname='" + comicname + '\'' +
                ", author='" + author + '\'' +
                ", introduction='" + introduction + '\'' +
                ", code='" + code + '\'' +
                ", area='" + area + '\'' +
                ", updatetime='" + updatetime + '\'' +
                ", photopath='" + photopath + '\'' +
                ", score=" + score +
                ", heat=" + heat +
                ", comicLists=" + comicLists +
                ", clids=" + Arrays.toString(clids) +
                '}';
    }
}
