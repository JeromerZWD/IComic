package com.controller;

import com.entity.Chapter;
import com.entity.Comic;
import com.entity.HaveList;
import com.service.ComicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
    public String addComic(Comic comic, MultipartFile file){
        // 图片上传
        // 设置图片名称，不能重复，可以使用uuid
        String picName = UUID.randomUUID().toString();
        // 获取文件名
        String oriName = file.getOriginalFilename();
        // 获取图片后缀
        String extName = oriName.substring(oriName.lastIndexOf("."));
        // 开始上传
        try {
            file.transferTo(new File("D:/upload/" + picName + extName));
            /*model.addAttribute("pic",picName + extName);*/
        } catch (IOException e) {
            e.printStackTrace();
        }
        comic.setPhotopath(picName + extName);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format( new Date());
        comic.setUpdatetime(dateString);
        int a=comicService.addComic(comic);
        if (a>0){
            return "redirect:getComics";
        }else {
            return "admin/404";
        }
    }

    /**
     * 通过漫画id 查询所有章节
     * @param comicid
     * @param model
     * @return
     */
    @RequestMapping("/chapterList")
    public String chapterList(int comicid,Model model){
        System.out.println(comicid);
        List<Chapter> list=comicService.getChaptersByComicId(comicid);
        model.addAttribute("chapterList",list);
        return "admin/chapterList";
    }

    /**
     * 添加章节
     * @param chapter
     * @param file
     * @return
     */
    @RequestMapping("/addChapter")
    public String addChapter(Chapter chapter,MultipartFile file){
        // 图片上传
        // 设置图片名称，不能重复，可以使用uuid
        String picName1 = UUID.randomUUID().toString();
        // 获取文件名
        String oriName1 = file.getOriginalFilename();
        // 获取图片后缀
        String extName1 = oriName1.substring(oriName1.lastIndexOf("."));
        // 开始上传
        try {
            file.transferTo(new File("D:/upload/chapter/" + picName1 + extName1));
            /*model.addAttribute("pic",picName + extName);*/
        } catch (IOException e) {
            e.printStackTrace();
        }
        chapter.setContent(picName1 + extName1);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format( new Date());
        chapter.setCtime(dateString);
        Comic comic=comicService.getComicById(chapter.getComicid());
        comic.setUpdatetime(dateString);
        comicService.updateTime(comic);
        int a=comicService.addChapter(chapter);
        if (a>0){
            return "redirect:getComics";
        }else {
            return "admin/404";
        }
    }

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
     * 通过章节数和漫画id 查询某章节
     * @param chapter
     * @param model
     * @return
     */
    @RequestMapping("/getChapterByNumber")
    public String getChapterByNumber(Chapter chapter,Model model){
        List<Chapter> list=comicService.getChapterByNumber(chapter);
        model.addAttribute("chapterList",list);
        return "admin/chapterList";
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
    @RequestMapping("/index")
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
}
