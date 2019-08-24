package com.controller;

import com.entity.Admin;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ComicService comicService;
    @RequestMapping("/adminLogin")
    public String adminLogin(Admin admin, Model model){
        Admin list=adminService.loginCheck(admin);
        if (list!=null){
            model.addAttribute("adminUser",list.getUsername());
            return "admin/admin";
        }else {
            model.addAttribute("msg","用户名或密码错误!");
            return "admin/login";
        }
    }
    @RequestMapping("/adminIndex")
    public String adminIndex(Model model){
        int countUser=userService.countUser();
        int countMessage=messageService.countMessage();
        int countAdmin=adminService.countAdmin();
        int conutClose=userService.getCloseUsers().size();
        int countComment=commentService.getComments().size();
        int countComic=comicService.getComics().size();
        model.addAttribute("countUser",countUser);
        model.addAttribute("countMessage",countMessage);
        model.addAttribute("countAdmin",countAdmin);
        model.addAttribute("countClose",conutClose);
        model.addAttribute("countComment",countComment);
        model.addAttribute("countComic",countComic);
        return "admin/home";
    }
}
