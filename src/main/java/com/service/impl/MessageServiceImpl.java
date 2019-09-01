package com.service.impl;

import com.entity.Message;
import com.mapper.MessageMapper;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;
    @Override
    public List<Message> getMessages() {
        return messageMapper.getMessages();
    }

    @Override
    public int deleteMessage(int id) {
        return messageMapper.deleteMessage(id);
    }

    @Override
    public int countMessage() {
        return messageMapper.countMessage();
    }

    @Override
    public List<Message> getMessagesByName(String name) {
        return messageMapper.getMessagesByName(name);
    }

    @Override
    public int addMessage(Message message) {
        return messageMapper.addMessage(message);
    }
}
