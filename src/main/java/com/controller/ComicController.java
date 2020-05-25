package com.controller;

import com.entity.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.ComicService;
import com.service.CommentService;
import com.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class ComicController {
    @Autowired
    private ComicService comicService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private FavoriteService favoriteService;


    /**
     * 删除章节通过章节id
     * @param id
     * @return
     */
    @RequestMapping("/deleteChapterById")
    @ResponseBody
    public String deleteChapterById(int id){
        int a=comicService.deleteChapterById(id);
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
     * 删除漫画 通过漫画id
     * @param id
     * @return
     */
    @RequestMapping("/deleteComicById")
    @ResponseBody
    public String deleteComicById(int id){
        int a=comicService.deleteComicById(id);
        comicService.deleteTypeById(id);
        if (a>0){
            return "ok";
        }else {
            return "error";
        }
    }

    /////////////////////////////////////////////
    @RequestMapping({"/","/index"})
    public String index(Model model){
        Comic comic=new Comic();
        List<Comic> heatList=comicService.getComicSByOther(comic);
        comic.setArea("国漫");
        List<Comic> list=comicService.getComicSByOther(comic);
        Comic comic1=new Comic();
        comic1.setArea("日漫");
        List<Comic> list1=comicService.getComicSByOther(comic1);
        Comic comic2=new Comic();
        comic2.setArea("欧美");
        List<Comic> list2=comicService.getComicSByOther(comic2);
        List<Comic> timeList=comicService.getComics();

        List<Chapter> list3=comicService.getChapter();
        for (int i=0;i<3;i++){
            list3.get(i).setComicname(comicService.getComicById(list3.get(i).getComicid()).getComicname());
        }

        model.addAttribute("timeList",timeList);
        model.addAttribute("heatList",heatList);
        model.addAttribute("guo",list);
        model.addAttribute("ri",list1);
        model.addAttribute("ou",list2);
        model.addAttribute("zhang",list3);

        return "index/index";
    }
    @RequestMapping("/protfolio")
    public String protfolio(Model model, Comic comic){
        List<Comic> list=new ArrayList<>();
        if (comic.getArea()!=null || comic.getCcode()!=null){
            list=comicService.getComicSByOther(comic);
        }else {
            list = comicService.getComics();
        }
        model.addAttribute("comicList",list);
        return "index/protfolio";
    }
    @RequestMapping("protfolio1")
    public String protfolio1(Model model,int comiclistid){
        List<Comic> list=comicService.getComicByTypeId(comiclistid);
        model.addAttribute("comicList",list);
        return "index/protfolio";
    }
    @RequestMapping("/getUpdateChapter")
    public String getUpdateChapter(Model model){
        List<Chapter> list=comicService.getChapter();
        model.addAttribute("chapterList",list);
        List<Comment> list1=commentService.getComments();
        model.addAttribute("commentList",list1);
        return "index/blog";
    }

    /**
     *
     * 首页-通过漫画id获取漫画详情
     * @param id
     * @param model
     * @param pn
     * @param request
     * @return
     */
    @RequestMapping("/getDetail")
    public String getDetail(int id,Model model,HttpServletRequest request,
                            @RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //对漫画进行热度+1
        comicService.addHeat(id);
        //按地区对漫画进行排列
        Comic comic=new Comic();
        comic.setArea("国漫");
        List<Comic> list=comicService.getComicSByOther(comic);
        comic.setArea("日漫");
        List<Comic> list1=comicService.getComicSByOther(comic);
        comic.setArea("欧美");
        List<Comic> list2=comicService.getComicSByOther(comic);
        Comic comic1=comicService.getComicById(id);
        List<Chapter> chapterList=comicService.getChaptersByComicId(id);
        //获取相似漫画列表并进行分页
        PageHelper.startPage(pn,10);
        List<Comic> lists = comicService.getLikeComic(id);
        PageInfo<Comic> pageInfo = new PageInfo<>(lists);
       model.addAttribute("like",pageInfo);
        model.addAttribute("guo",list);
        model.addAttribute("ri",list1);
        model.addAttribute("ou",list2);
        model.addAttribute("comic",comic1);
        model.addAttribute("chapterList",chapterList);
        List<Comment> list3=commentService.getCommentsByComicId(id);
        model.addAttribute("commentList",list3);
        User user=(User) request.getSession().getAttribute("userSession");
        model.addAttribute("isFavorite",false);
        //收藏漫画接口处理
        if (user!=null){
            Favorite favorite=new Favorite();
            favorite.setUserId(user.getId());
            favorite.setComicId(id);
            List<Favorite> favoriteList=favoriteService.getFavorites(favorite);
            if (favoriteList!=null && favoriteList.size()!=0){
                model.addAttribute("isFavorite",true);
            }
        }
        return "index/detail";
    }

    @RequestMapping("/getSingle")
    public String getSingle(Chapter chapter,Model model){
        List<Chapter> list=comicService.getChapterByNumber(chapter);
        model.addAttribute("chapter",list.get(0));
        List<String> list1=Arrays.asList(list.get(0).getContent().split(","));
        model.addAttribute("photoList",list1);
        return "index/single-blog";
    }

    @RequestMapping("/getComicByLikeName")
    public String getComicByLikeName(Model model,String comicname){
        List<Comic> list=comicService.getComicByLikeName(comicname);
        model.addAttribute("comicList",list);
        return "index/select";
    }
}
