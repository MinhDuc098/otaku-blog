package com.example.demo.controllers;

import com.example.demo.service.ChangePasswordService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/")
public class ChangePasswordController {

    @Autowired
    private ChangePasswordService changePasswordService;

    @GetMapping(path = "/toChangePassword")
    private String toChangePassword(int id,Model model){
        model.addAttribute("userId",id);
        return "ChangePassword/changePassword";
    }

    @PostMapping(path = "/changePassword")
    private String changePassword(HttpSession session, String oldPassword, String newPassword, int userId, Model model){
        return changePasswordService.changePasswordService(session,oldPassword,newPassword,userId,model);
    }
}
