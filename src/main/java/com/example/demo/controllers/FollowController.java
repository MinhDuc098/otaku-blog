package com.example.demo.controllers;

import com.example.demo.service.FollowService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(path = "/")
public class FollowController {

    @Autowired
    private FollowService followService;

    @PostMapping(path = "/follow")
    public String follow(int userid,String link ,HttpSession session, RedirectAttributes attributes){
        return followService.follow(userid,link,session, attributes);
    }
}
