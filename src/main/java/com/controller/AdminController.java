package com.controller;

import com.entity.Admin;
import com.entity.Chapter;
import com.entity.Comic;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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

    /**
     * 管理员登陆校验
     * @param admin
     * @param model
     * @return
     */
    @RequestMapping("/adminLogin")
    public String adminLogin(Admin admin, Model model){
        Admin list=adminService.loginCheck(admin);
        if (list!=null){
            model.addAttribute("adminUser",list);
            return "admin/admin";
        }else {
            model.addAttribute("msg","用户名或密码错误!");
            return "admin/login";
        }
    }

    /**
     * 管理页面-主页
     * @param model
     * @return
     */
    @RequestMapping("/adminIndex")
    public String adminIndex(Model model){
        int countUser=userService.countUser();
        int countMessage=messageService.countMessage();
        int countAdmin=adminService.countAdmin();
        int conutClose=userService.getCloseUsers().size();
        int countComment=commentService.getComments().size();
        int countComic=comicService.getComics().size();
        int countHeat=comicService.getHeats();
        model.addAttribute("countUser",countUser);
        model.addAttribute("countMessage",countMessage);
        model.addAttribute("countAdmin",countAdmin);
        model.addAttribute("countClose",conutClose);
        model.addAttribute("countComment",countComment);
        model.addAttribute("countComic",countComic);
        model.addAttribute("countHeat",countHeat);
        return "admin/home";
    }

    /**
     * 漫画管理-查询所有漫画getComicSByOther
     * @param model
     * @return
     */
    @RequestMapping("/getComics")
    public String getComics(Model model, @RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Comic> lists = comicService.getComics();
        PageInfo<Comic> pageInfo = new PageInfo<>(lists);
        model.addAttribute("comicList",pageInfo);
        return "admin/comicList";
    }

    /**
     * 漫画管理-新增漫画
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
     * 漫画管理-通过漫画id 查询所有章节
     * @param comicid
     * @param model
     * @return
     */
    @RequestMapping("/chapterList")
    public String chapterList(int comicid,Model model,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Chapter> lists = comicService.getChaptersByComicId(comicid);
        PageInfo<Chapter> pageInfo = new PageInfo<>(lists);
        model.addAttribute("chapterList",pageInfo);
        model.addAttribute("comicid",comicid);
        return "admin/chapterList";
    }

    /**
     * 漫画管理-添加章节
     * @param chapter
     * @param file
     * @return
     */
    @RequestMapping("/addChapter")
    public String addChapter(Chapter chapter, MultipartFile[] file){
        // 图片上传
        // 设置图片名称，不能重复，可以使用uuid
        StringBuffer photoPathList=new StringBuffer();
        System.out.println(file.length);
        for (int i=0;i<file.length;i++){
            String picName1 = UUID.randomUUID().toString();
            // 获取文件名
            String oriName1 = file[i].getOriginalFilename();
            // 获取图片后缀
            String extName1 = oriName1.substring(oriName1.lastIndexOf("."));
            // 开始上传
            try {
                file[i].transferTo(new File("D:/upload/chapter/" + picName1 + extName1));
                /*model.addAttribute("pic",picName + extName);*/
            } catch (IOException e) {
                e.printStackTrace();
            }
            if (i==file.length-1){
                photoPathList.append(picName1 + extName1);
            }else {
                photoPathList.append(picName1 + extName1+",");
            }
        }
        chapter.setContent(photoPathList.toString());
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
     * 漫画管理-通过漫画名、作者、状态、地区 查询漫画
     * @param comic
     * @param model
     * @return
     */
    @RequestMapping("/getComicSByOther")
    public String getComicSByOther(Comic comic,Model model,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<Comic> lists = comicService.getComicSByOther(comic);
        PageInfo<Comic> pageInfo = new PageInfo<>(lists);
        model.addAttribute("comicList",pageInfo);
        return "admin/comicList";
    }

    /**
     * 漫画管理-通过章节数和漫画id 查询某章节
     * @param chapter
     * @param model
     * @return
     */
    @RequestMapping("/getChapterByNumber")
    public String getChapterByNumber(Chapter chapter,Model model){
        PageHelper.startPage(1,5);
        List<Chapter> list=comicService.getChapterByNumber(chapter);
        PageInfo<Chapter> pageInfo = new PageInfo<>(list);
        model.addAttribute("chapterList",pageInfo);
        model.addAttribute("isFlag",true);
        return "admin/chapterList";
    }


}
