package com.example.demo.controllers;

import com.example.demo.service.AdminService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(path = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping(path = "/manageUserAccount")
    public String manageUserAccount(HttpSession session,Model model, @RequestParam(defaultValue = "0") int pageNo, @RequestParam(defaultValue = "7") int pageSize){
        return adminService.manageUserAccount(session,model,pageNo,pageSize);
    }

    @GetMapping(path = "/banOrRemoveBan")
    public String banOrRemoveBan(int id, HttpSession session){
        return adminService.banOrRemoveBan(id,session);
    }

    @GetMapping(path = "/managePost")
    public String managePost(HttpSession session, Model model,@RequestParam(defaultValue = "0") int pageNo,@RequestParam(defaultValue = "10") int pageSize, @RequestParam(defaultValue = "") String followStatus){
        return adminService.managePost(session,model,pageNo,pageSize);
    }

    @GetMapping(path = "/adminDeletePost")
    public String adminDeletePost(int id,HttpSession session){
        return adminService.adminDeletePost(id,session);
    }

    @GetMapping(path = "/adminNotification")
    public String adminNotification(HttpSession session, Model model){
        return adminService.adminNotification(session,model);
    }

    @GetMapping(path = "/searchUserById")
    public String searchUserById(int userId,HttpSession session,Model model){
        return adminService.searchUserById(userId,session,model);
    }

    @GetMapping(path = "/deleteReportUser")
    public String deleteReportUser(int reportUserId, HttpSession session){
        return adminService.deleteReportUser(reportUserId,session);
    }

    @GetMapping(path = "/deleteReportPost")
    public String deleteReportPost(int reportPostId, HttpSession session){
        return adminService.deleteReportPost(reportPostId,session);
    }

    @PostMapping(path = "/sendNotification")
    public String sendNotification(String notficationContent, int receiverId, HttpSession session){
        return adminService.sendNotification(notficationContent,receiverId, session);
    }

    @GetMapping(path = "/upAuthor")
    public String upAuthor(int userId, HttpSession session){
        return adminService.upAuthor(userId,session);
    }
}
