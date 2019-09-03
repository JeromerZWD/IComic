package com.service;

import com.entity.Comment;
import com.entity.Message;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface CommentService {
    // 查询所有评论
    List<Comment> getComments();
    //删除评论
    int deleteComment(int id);
    //通过漫画id或取所有评论
    List<Comment> getCommentsByComicId(int comicid);
    //添加评论
    int addComment(Comment comment);
}
