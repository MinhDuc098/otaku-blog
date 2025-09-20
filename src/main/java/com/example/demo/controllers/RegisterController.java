package com.example.demo.controllers;

import com.example.demo.service.RegisterService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping(path = "/")
public class RegisterController {
    @Autowired
    public RegisterService registerService;
    @PostMapping(path = "/register")
    public String register(String email, String username,HttpSession session){
        return registerService.register(email,username,session);

    }
}
