package com.controller;

import com.entity.Comment;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @RequestMapping("/commentList")
    public String commentList(Model model,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Comment> lists = commentService.getComments();
        PageInfo<Comment> pageInfo = new PageInfo<>(lists);
        model.addAttribute("commentList",pageInfo);
        return "admin/commentList";
    }
    @RequestMapping("/deleteComment")
    @ResponseBody
    public String deleteComment(int id){
        int a=commentService.deleteComment(id);
        if (a>0){
            return "ok";
        }else{
            return "error";
        }
    }
    @RequestMapping("/commentListByComicId")
    public String commentListByComicId(Model model,int comicid,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Comment> lists = commentService.getCommentsByComicId(comicid);
        PageInfo<Comment> pageInfo = new PageInfo<>(lists);
        model.addAttribute("commentList",pageInfo);
        return "admin/commentList";
    }

    /**
     * 新增漫画评论
     * @param comment
     * @return
     */
    @RequestMapping("/addComment")
    @ResponseBody
    public String addComment(Comment comment){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format( new Date());
        comment.setCtime(dateString);
        int a=commentService.addComment(comment);
        if (a>0){
            return "ok";
        }else{
            return "error";
        }
    }
}
