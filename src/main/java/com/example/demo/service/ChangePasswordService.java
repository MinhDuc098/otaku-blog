package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ChangePasswordService {
    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserRepository userRepository;


    public String changePasswordService(HttpSession session, String oldPassword, String newPassword, int userId, Model model) {
        if(session.getAttribute("userID")!=null){
            User user = userRepository.findById(userId).orElseThrow();
            if(!bCryptPasswordEncoder.matches(oldPassword,user.getUserPassword())){
                model.addAttribute("error","Wrong Password");
                model.addAttribute("userId",userId);
                return "ChangePassword/changePassword";
            }
            else{
                user.setUserPassword(bCryptPasswordEncoder.encode(newPassword));
                userRepository.save(user);
                session.setAttribute("message","change password successfull please login again");
                return "redirect:./tologin";
            }
        }
        session.setAttribute("message","you have to login first");
        return "redirect./tologin";
    }
}
