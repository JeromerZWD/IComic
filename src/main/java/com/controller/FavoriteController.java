package com.controller;

import com.entity.Favorite;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author zwd
 * @desc
 * @date 2019/12/31 14:56
 */
@Controller
public class FavoriteController {
    @Autowired
    FavoriteService favoriteService;


    @RequestMapping("/addFavorite")
    @ResponseBody
    public String addFavorite(Favorite favorite) {
        int a = favoriteService.addFavorite(favorite);
        if (a > 0) {
            return "ok";
        } else {
            return "error";
        }
    }

    @RequestMapping("/removeFavorite")
    @ResponseBody
    public String removeFavorite(Favorite favorite) {
        int a = favoriteService.removeFavorite(favorite);
        if (a > 0) {
            return "ok";
        } else {
            return "error";
        }
    }

    /**
     * 查询收藏列表-通过用户id
     * @param favorite
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/getFavoritesByUserId")
    public String getFavoritesByUserId(Favorite favorite, @RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        PageHelper.startPage(pn, 3);
        List<Favorite> list = favoriteService.getFavorites(favorite);
        PageInfo<Favorite> pageInfo = new PageInfo<>(list);
        model.addAttribute("favoriteList", pageInfo);
        return "index/getFavorites";
    }


}
