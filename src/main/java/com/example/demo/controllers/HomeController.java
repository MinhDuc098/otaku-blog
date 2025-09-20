package com.example.demo.controllers;


import com.example.demo.model.Category;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.repositories.UserRepository;
import com.example.demo.service.HomeService;
import com.example.demo.service.SearchService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(path = "/")
public class HomeController {
    @Autowired
    private HomeService homeService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SearchService searchService;

    @GetMapping(path = "/home")
    public String loadhomePage(HttpSession session, Model model, @RequestParam(defaultValue = "0") int pageNo, @RequestParam(defaultValue = "10") int pageSize, @RequestParam(defaultValue = "") String followStatus){
        List<Category> listCategory = homeService.getListCategory();
        Page<Post> page = homeService.getPostByOffset(pageNo,pageSize);
        List<User> Users = userRepository.findTop3ByOrderByNumberFollowerDesc();
        List<Post> prominentPosts = homeService.getAllPost();
        if(session.getAttribute("userID")!= null){
            User user = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();
            model.addAttribute("userNotify",user.getUserNotification());

            if((int)session.getAttribute("userAuthor") == 5){
                model.addAttribute("adminNotify",user.getAdminNotification());
            }
        }



        model.addAttribute("prominentPosts",prominentPosts);
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("users",Users);
        model.addAttribute("numPage",page.getTotalPages());

        model.addAttribute("posts",page.getContent());
        model.addAttribute("currentPage", pageNo);
        return "Home/homePage";
    }

    @GetMapping(path = "/searchByCategory")
    public String searchByCategory(HttpSession session,@RequestParam int id,Model model,@RequestParam(defaultValue = "0") int pageNo,@RequestParam(defaultValue = "10") int pageSize){
        return homeService.searchByCategory(session,id,model,pageNo,pageSize);
    }

    @PostMapping(path = "/search")
    public String search(HttpSession session,@RequestParam String name, Model model,@RequestParam(defaultValue = "0") int pageNo,@RequestParam(defaultValue = "10") int pageSize){
        return searchService.search(session,name,pageNo,pageSize,model);
    }
}
