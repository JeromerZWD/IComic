package com.entity;

public class Message {
    private int id;
    private String mname;
    private String email;
    private String message;

    public Message() {
    }

    public Message(int id, String mname, String email, String message) {
        this.id = id;
        this.mname = mname;
        this.email = email;
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", mname='" + mname + '\'' +
                ", email='" + email + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
