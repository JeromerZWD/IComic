package com.controller;

import com.entity.Comic;
import com.service.ComicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
