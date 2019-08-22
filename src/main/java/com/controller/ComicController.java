package com.controller;

import com.entity.Comic;
import com.service.ComicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ComicController {
    @Autowired
    private ComicService comicService;
    @RequestMapping("/getComics")
    public String getComics(Model model){
        List<Comic> list=comicService.getComics();
        model.addAttribute("comicList",list);
        return "admin/comicList";
    }
}
