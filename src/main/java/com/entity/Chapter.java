package com.entity;

public class Chapter {
    private int id;
    private int comicid;
    private int number;
    private String name;
    private String introduction;
    private String time;
    private String content;

    public Chapter() {
    }

    public Chapter(int id, int comicid, int number, String name, String introduction, String time, String content) {
        this.id = id;
        this.comicid = comicid;
        this.number = number;
        this.name = name;
        this.introduction = introduction;
        this.time = time;
        this.content = content;
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "id=" + id +
                ", comicid=" + comicid +
                ", number=" + number +
                ", name='" + name + '\'' +
                ", introduction='" + introduction + '\'' +
                ", time='" + time + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
