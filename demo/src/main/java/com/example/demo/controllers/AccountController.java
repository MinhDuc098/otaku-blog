package com.example.demo.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.example.demo.model.Category;
import com.example.demo.model.Notification;
import com.example.demo.model.ReportUser;
import com.example.demo.model.User;
import com.example.demo.repositories.CategoryRepository;
import com.example.demo.repositories.NotificationRepository;
import com.example.demo.repositories.ReportUserRepository;
import com.example.demo.repositories.UserRepository;
import com.example.demo.service.HomeService;
import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.*;

@Controller
@RequestMapping(path = "/")
public class AccountController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HomeService homeService;

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private ReportUserRepository reportUserRepository;

    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping(path = "/toYourAccount")
    public String toAccount(HttpSession session,@RequestParam int id, Model model){
        if(session.getAttribute("userID")!= null) {
            Optional<User> user = userRepository.findById(id);
            List<Category> listCategory = homeService.getListCategory();


            User us = userRepository.findById((int) session.getAttribute("userID")).orElseThrow();
            model.addAttribute("userNotify", us.getUserNotification());


            model.addAttribute("listCategory", listCategory);
            user.ifPresent(u -> model.addAttribute("User", u));

            return "Account/yourAccount";
        }
        session.setAttribute("message","you have to login to do it");
        return "Login/login";
    }

    @PostMapping(path = "/updateAccount")
    public String updateAccount(int id, String describe,
                                      String username, String email,
                                      LocalDateTime dateofbirth, String password, RedirectAttributes attributes,
                                      MultipartFile img){
        Optional<User> user = userRepository.findById(id);
        user.ifPresent(u-> {
            Map params = ObjectUtils.asMap(
                    "public_id", "my-image",
                    "overwrite", true
            );
            try {
                Map result = cloudinary.uploader().upload(img.getBytes(), params);

                u.setUserImg(result.get("url").toString());
                u.setUserDescription(describe);
                u.setUserName(username);
                u.setUserEmail(email);
                u.setUserDateOfBirth(dateofbirth);
                u.setUserPassword(password);
                userRepository.save(u);

            } catch (IOException e) {
                e.printStackTrace();
            }


        });
        attributes.addAttribute("id",id);
        return "redirect:/toYourAccount";
    }


    @PostMapping(path = "/reportUser")
    public String reportUser(String reason, int userId, HttpSession session, RedirectAttributes attributes ){
        if(session.getAttribute("userID") != null){

            LocalDateTime now = LocalDateTime.now();
            ReportUser reportUser = new ReportUser();
            User userBeReport = userRepository.findById(userId).orElseThrow();
            User userReport = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();

            reportUser.setCreatedAt(now);
            reportUser.setReason(reason);
            reportUser.setReportedUser(userBeReport);
            reportUser.setReportingUser(userReport);

            reportUserRepository.save(reportUser);
            List<User> listAdmin = userRepository.getAllAdmin();
            for (User admin: listAdmin) {
                admin.setUserNotification(admin.getUserNotification()+1);
            }

            attributes.addAttribute("authorId",userId);
            return "redirect:./toAuthorBlog";
        }
        session.setAttribute("message","you have to login to use that function");
        return "redirect:./tologin";
    }

    @GetMapping(path = "/toUserNotify")
    public String toUserNotify(HttpSession session, Model model){

        if(session.getAttribute("userID")!=null) {


            User user = userRepository.findById((int) session.getAttribute("userID")).orElseThrow();
            List<Notification> notifications = user.getNotifications();
            Collections.sort(notifications, Comparator.comparing(Notification::getCreatedAt).reversed());


            List<Category> listCategory = categoryRepository.findAll();
            user.setUserNotification(0);

            model.addAttribute("userNotify",user.getUserNotification());
            model.addAttribute("notifies", notifications);
            model.addAttribute("listCategory",listCategory);
            return "Account/userNotification";
        }
        session.setAttribute("message","you have to login to do it");
        return "redirect:./tologin";
    }

    @GetMapping(path = "/deleteUserNotify")
    public String deleteUserNotify(int notifyId){
        Notification notification = notificationRepository.findById(notifyId).orElseThrow();
        notificationRepository.delete(notification);
        return "redirect:./toUserNotify";
    }








}
