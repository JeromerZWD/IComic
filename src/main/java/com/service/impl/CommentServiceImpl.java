package com.service.impl;

import com.entity.Comment;
import com.entity.Message;
import com.mapper.CommentMapper;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> getComments() {
        return commentMapper.getComments();
    }

    @Override
    public int deleteComment(int id) {
        return commentMapper.deleteComment(id);
    }

    @Override
    public List<Comment> getCommentsByComicId(int comicid) {
        return commentMapper.getCommentsByComicId(comicid);
    }
}
