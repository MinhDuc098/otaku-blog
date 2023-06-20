package com.example.demo.service;

import com.example.demo.model.*;
import com.example.demo.repositories.*;
import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class AdminService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private ReportUserRepository reportUserRepository;

    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private NotificationRepository notificationRepository;


    public String manageUserAccount(HttpSession session,Model model, int pageNo, int pageSize){
        if(session.getAttribute("userAuthor") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            if ((int) session.getAttribute("userAuthor") == 5) {
                Pageable pageable = PageRequest.of(pageNo, pageSize);

                Page<User> userList = userRepository.getAllUser(pageable);

                model.addAttribute("userList", userList.getContent());
                model.addAttribute("numPage", userList.getTotalPages());
                model.addAttribute("currentPage", pageNo);
                return "Admin/adminUser";
            }
            else{
                session.setAttribute("message","you doesn't have author to do it");
                return "redirect:../tologin";
            }
        }
    }

    public String banOrRemoveBan(int id, HttpSession session) {
        if(session.getAttribute("userAuthor") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            if((int)session.getAttribute("userAuthor") == 5){
            User user = userRepository.findById(id).orElseThrow();
            if(user.getUserBanned() == 1){
                user.setUserBanned(0);
            }
            else {
                user.setUserBanned(1);
            }
            userRepository.save(user);
            return "redirect:./manageUserAccount";
            }
            else{
                session.setAttribute("message","you doesn't have author to do it");
                return "redirect:../tologin";
            }
        }

    }

    public String managePost(HttpSession session,Model model,int pageNo, int pageSize) {
        if(session.getAttribute("userAuthor") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            if((int)session.getAttribute("userAuthor") >= 4){
                Pageable pageable = PageRequest.of(pageNo, pageSize);
                Page<Post> page = postRepository.getAllPost(pageable);



                model.addAttribute("numPage",page.getTotalPages());
                model.addAttribute("posts",page.getContent());
                model.addAttribute("currentPage", pageNo);
                return "Admin/adminBlog";
            }
            else{
                session.setAttribute("message","you doesn't have author to do it");
                return "redirect:../tologin";
            }
        }
    }

    public String adminDeletePost(int id,HttpSession session) {
        if(session.getAttribute("userID")!= null){
            if((int)session.getAttribute("userAuthor") == 5){
                postRepository.deleteById(id);
            }
        }
        else{
            session.setAttribute("message","You have to login to do first");
            return "Login/login";
        }

        return "redirect:./managePost";
    }

    public String adminNotification(HttpSession session, Model model) {
        if(session.getAttribute("userAuthor") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            if((int)session.getAttribute("userAuthor") >= 4){
                User admin = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();
                admin.setAdminNotification(0);
                List<ReportUser> reportUsers = reportUserRepository.findAllByOrderByCreatedAtDesc();
                List<Report> reports = reportRepository.findAllByOrderByCreatedAtDesc();

                model.addAttribute("reportUsers",reportUsers);
                model.addAttribute("reports",reports);

                return "Admin/adminNotification";
            }
            else{
                session.setAttribute("message","you doesn't have author to do it");
                return "redirect:../tologin";
            }
        }
    }

    public String searchUserById(int userId, HttpSession session,Model model) {
        if(session.getAttribute("userID") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            Optional <User> user = userRepository.findById(userId);
            user.ifPresent(u -> model.addAttribute("userList",u));

            return "Admin/adminUser";

        }
    }
//delete report user
    public String deleteReportUser(int reportUserId, HttpSession session) {
        if(session.getAttribute("userAuthor") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            if((int)session.getAttribute("userAuthor") == 5){

                ReportUser reportUser = reportUserRepository.findById(reportUserId).orElseThrow();
                reportUserRepository.delete(reportUser);
               return "redirect:./adminNotification";
            }
            else{
                session.setAttribute("message","you doesn't have author to do it");
                return "redirect:../tologin";
            }
        }
    }
//delete report post
    public String deleteReportPost(int reportPostId, HttpSession session) {
        if(session.getAttribute("userAuthor") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            if((int)session.getAttribute("userAuthor") == 5){

                Report report = reportRepository.findById(reportPostId).orElseThrow();
                reportRepository.delete(report);
                return "redirect:./adminNotification";
            }
            else{
                session.setAttribute("message","you doesn't have author to do it");
                return "redirect:../tologin";
            }
        }
    }

    public String sendNotification(String notficationContent, int receiverId, HttpSession session) {
        if(session.getAttribute("userAuthor") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            if((int)session.getAttribute("userAuthor") == 5){

                Notification notification = new Notification();
                LocalDateTime now = LocalDateTime.now();
                User userRelate = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();
                User userReceiver = userRepository.findById(receiverId).orElseThrow();

//               create notification
                notification.setNotificationContent(notficationContent);
                notification.setUserReceiverNotification(userReceiver);
                notification.setCreatedAt(now);
                notification.setUserRelate(userRelate);

//              create notice new notification for user
                userReceiver.setUserNotification(userReceiver.getUserNotification()+1);

                notificationRepository.save(notification);

                return "redirect:./manageUserAccount";
            }
            else{
                session.setAttribute("message","you doesn't have author to do it");
                return "redirect:../tologin";
            }
        }
    }

    public String upAuthor(int userId, HttpSession session) {
        if(session.getAttribute("userAuthor") == null){
            session.setAttribute("message","you have to login to use that function");
            return "redirect:../tologin";
        }
        else {
            if((int)session.getAttribute("userAuthor") == 5){
                User user = userRepository.findById(userId).orElseThrow();
                if(user.getUserAuthor() <5){
                    user.setUserAuthor(user.getUserAuthor()+1);
                }
                else if(user.getUserAuthor() == 5){
                    user.setUserAuthor(user.getUserAuthor()-4);
                }


                return "redirect:./manageUserAccount";
            }
            else{
                session.setAttribute("message","you doesn't have author to do it");
                return "redirect:../tologin";
            }
        }
    }
}
