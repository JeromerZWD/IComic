package com.controller;

import com.entity.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MessageController {
        @Autowired
        private MessageService messageService;

    /**
     * 查询游客留言
     * @param model
     * @param pn
     * @return
     */
        @RequestMapping("/messageList")
        public String messageList(Model model,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
            PageHelper.startPage(pn,5);
            List<Message> lists = messageService.getMessages();
            PageInfo<Message> pageInfo = new PageInfo<>(lists);
            model.addAttribute("messageList",pageInfo);
        return "admin/messageList";
    }
        @RequestMapping("/deleteMessage")
        @ResponseBody
        public String deleteMessage(int id){
            int a=messageService.deleteMessage(id);
            if (a>0){
                return "ok";
            }else {
                return "error";
            }
        }

     @RequestMapping("/getMessagesByName")
    public String getMessagesByName(String name,Model model, @RequestParam(value = "pn",defaultValue = "1")Integer pn){
         PageHelper.startPage(pn,5);
         List<Message> lists = messageService.getMessagesByName(name);
         PageInfo<Message> pageInfo = new PageInfo<>(lists);
        model.addAttribute("messageList",pageInfo);
            return "admin/messageList";
        }

     @RequestMapping("/addMessage")
     @ResponseBody
    public String addMessage(Message message){
            int a=messageService.addMessage(message);
            if (a>0){
                return "ok";
            }else{
                return "error";
            }
     }
}
