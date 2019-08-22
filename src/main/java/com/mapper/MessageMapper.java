package com.mapper;

import com.entity.Message;

import java.util.List;

public interface MessageMapper {
    // 查询所有留言
    List<Message> getMessages();
    //删除留言
    int deleteMessage(int id);
    //消息总量
    int countMessage();
    //通过用户名查留言
    List<Message> getMessagesByName(String name);
}
