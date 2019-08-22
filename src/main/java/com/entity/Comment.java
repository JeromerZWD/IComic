package com.entity;

public class Comment {
    private int id;
    private int userid;
    private int comicid;
    private String message;
    private String time;

    public Comment() { }

    public Comment(int id, int userid, int comicid, String message, String time) {
        this.id = id;
        this.userid = userid;
        this.comicid = comicid;
        this.message = message;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getComicid() {
        return comicid;
    }

    public void setComicid(int comicid) {
        this.comicid = comicid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userid=" + userid +
                ", comicid=" + comicid +
                ", message='" + message + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
