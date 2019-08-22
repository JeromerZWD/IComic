package com.controller;

import com.entity.Comment;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @RequestMapping("/commentList")
    public String commentList(Model model){
        List<Comment> list=commentService.getComments();
        model.addAttribute("commentList",list);
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
    public String commentListByComicId(Model model,int comicid){
        List<Comment> list=commentService.getCommentsByComicId(comicid);
        model.addAttribute("commentList",list);
        return "admin/commentList";
    }
}
