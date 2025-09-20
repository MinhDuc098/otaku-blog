package com.example.demo.controllers;

import com.example.demo.model.User;
import com.example.demo.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(path = "/")
public class LoginController {

    @Autowired
    private LoginService LoginService;


    @GetMapping(path = "/tologin")
    public String toLoginPage(Model model) {
        model.addAttribute("user", new User());
        return "Login/login";
    }

    @GetMapping(path = "/toforgotPassword")
    public String toForgotPassPage() {
        return "Login/ForgotPassword";
    }

//    @PostMapping(path = "/login")
//    public String Login(String password, String email,HttpSession session){
//
//        return LoginService.login(email, password,session );
//    }

    @PostMapping(path = "/forgotPassword")
    public String forgotPassword(String email, HttpSession session) {
        return LoginService.forgotPassword(email, session);
    }
}
