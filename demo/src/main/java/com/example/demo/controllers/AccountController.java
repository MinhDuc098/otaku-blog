package com.example.demo.controllers;

import com.example.demo.model.Category;
import com.example.demo.model.User;
import com.example.demo.repositories.CategoryRepository;
import com.example.demo.repositories.UserRepository;
import com.example.demo.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(path = "/")
public class AccountController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HomeService homeService;


    @GetMapping(path = "/toYourAccount")
    public String toAccount(@RequestParam int id, Model model){
        Optional<User> user = userRepository.findById(id);
        List<Category> listCategory = homeService.getListCategory();

        model.addAttribute("listCategory",listCategory);
        user.ifPresent(u-> model.addAttribute("User",u));

        return "Account/yourAccount";
    }

    @PostMapping(path = "/updateAccount")
    public String updateAccount(int id, String describe,
                                      String username, String email,
                                      LocalDateTime dateofbirth, String password, RedirectAttributes attributes){
        Optional<User> user = userRepository.findById(id);
        user.ifPresent(u-> {
            u.setUserDescription(describe);
            u.setUserName(username);
            u.setUserEmail(email);
            u.setUserDateOfBirth(dateofbirth);
            u.setUserPassword(password);
            userRepository.save(u);
        });
        attributes.addAttribute("id",id);
        return "redirect:/toYourAccount";
    }





}
