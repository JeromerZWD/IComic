package com.controller;

import com.entity.Comic;
import com.service.ComicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ComicController {
    @Autowired
    private ComicService comicService;

    /**
     * 查询所有漫画
     * @param model
     * @return
     */
    @RequestMapping("/getComics")
    public String getComics(Model model){
        List<Comic> list=comicService.getComics();
        model.addAttribute("comicList",list);
        return "admin/comicList";
    }

    /**
     * 新增漫画
     * @param comic
     * @return
     */
    @RequestMapping("/addComic")
    @ResponseBody
    public String addComic(Comic comic){
        int a=comicService.addComic(comic);
        if (a>0){
            return "ok";
        }else {
            return "error";
        }
    }

    /**
     * 通过漫画类型id 查询漫画
     * @param comiclistid
     * @param model
     * @return
     */
    @RequestMapping("/getComicByTypeId")
    public String getComicByTypeId(int comiclistid,Model model){
        List<Comic> list=comicService.getComicByTypeId(comiclistid);
        model.addAttribute("comicList",list);
        return "";
    }

    /**
     * 通过漫画名或作者或状态或地区 查询漫画
     * @param comic
     * @param model
     * @return
     */
    @RequestMapping("/getComicSByOther")
    public String getComicSByOther(Comic comic,Model model){
        List<Comic> list=comicService.getComicSByOther(comic);
        model.addAttribute("comicList",list);
        return "admin/comicList";
    }

    /**
     * 删除漫画 通过漫画id
     * @param comicid
     * @return
     */
    @RequestMapping("/deleteComicById")
    @ResponseBody
    public String deleteComicById(int comicid){
        int a=comicService.deleteComicById(comicid);
        if (a>0){
            return "ok";
        }else {
            return "error";
        }
    }
}
