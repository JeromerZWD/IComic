package com.controller;

import com.entity.Message;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MessageController {
        @Autowired
        private MessageService messageService;
        @RequestMapping("/messageList")
        public String messageList(Model model){
        List<Message> list=messageService.getMessages();
        model.addAttribute("messageList",list);
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
    public String getMessagesByName(String name,Model model){
        List<Message> list=messageService.getMessagesByName(name);
        model.addAttribute("messageList",list);
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
