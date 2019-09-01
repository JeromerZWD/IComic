package com.entity;

public class Chapter {
    private int id;
    private int comicid;
    private int cnumber;
    private String cname;
    private String ctime;
    private String content;
    private String comicname;

    public Chapter() {
    }

    public Chapter(int id, int comicid, int cnumber, String cname, String ctime, String content, String comicname) {
        this.id = id;
        this.comicid = comicid;
        this.cnumber = cnumber;
        this.cname = cname;
        this.ctime = ctime;
        this.content = content;
        this.comicname = comicname;
    }

    public String getComicname() {
        return comicname;
    }

    public void setComicname(String comicname) {
        this.comicname = comicname;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCnumber() {
        return cnumber;
    }

    public void setCnumber(int cnumber) {
        this.cnumber = cnumber;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "id=" + id +
                ", comicid=" + comicid +
                ", cnumber=" + cnumber +
                ", cname='" + cname + '\'' +
                ", ctime='" + ctime + '\'' +
                ", content='" + content + '\'' +
                ", comicname='" + comicname + '\'' +
                '}';
    }
}
