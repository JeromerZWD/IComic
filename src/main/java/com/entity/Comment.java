package com.entity;

public class Comment {
    private int id;
    private int userid;
    private int comicid;
    private String message;
    private String ctime;
    private User user;

    public Comment() { }

    public Comment(int id, int userid, int comicid, String message, String ctime, User user) {
        this.id = id;
        this.userid = userid;
        this.comicid = comicid;
        this.message = message;
        this.ctime = ctime;
        this.user = user;
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

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userid=" + userid +
                ", comicid=" + comicid +
                ", message='" + message + '\'' +
                ", ctime='" + ctime + '\'' +
                ", user=" + user +
                '}';
    }
}
