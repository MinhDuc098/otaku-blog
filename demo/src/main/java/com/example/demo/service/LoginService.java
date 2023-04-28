package com.example.demo.service;

import com.example.demo.EmailSenderService;
import com.example.demo.model.User;
import com.example.demo.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    @Autowired
    private UserRepository UserRepository;

    @Autowired
    private EmailSenderService emailSenderService;

    public String login(String username, String password, HttpSession session){
       final User u =  UserRepository.findByUser(username,password);
       if(u != null){
           if(u.getUserBanned()==0) {


               session.setAttribute("email", u.getUserEmail());
               session.setAttribute("userID", u.getUserId());
               session.setAttribute("userName", u.getUserName());
               session.setAttribute("userPass", u.getUserPassword());
               session.setAttribute("userImg", u.getUserImg());
               session.setAttribute("userAuthor",u.getUserAuthor());
               return "redirect:./home";
           }
           else {
               session.setAttribute("message","You have been banned ");
               return "Login/login";
           }

       }
       if(u == null){
            session.setAttribute("message","Your Account Doesn't Exist!");

            return "Login/login";
       }
       return "redirect:./home";

    }

    public String forgotPassword(String email,HttpSession session){
        User u = UserRepository.findByEmail(email);
        if(u==null){
            session.setAttribute("mess1", "your account doesn't exist");
            return "Login/ForgotPassword";
        }

        emailSenderService.sendMail(email,"Your Password", u.getUserPassword());
        return "Login/login";
    }
}
