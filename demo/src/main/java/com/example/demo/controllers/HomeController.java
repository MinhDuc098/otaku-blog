package com.example.demo.controllers;


import com.example.demo.model.Category;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.repositories.UserRepository;
import com.example.demo.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping(path = "/home")
    public String loadhomePage(Model model,@RequestParam(defaultValue = "0") int pageNo,@RequestParam(defaultValue = "10") int pageSize){
        List<Category> listCategory = homeService.getListCategory();
        Page<Post> page = homeService.getPostByOffset(pageNo,pageSize);
        List<User> Users = userRepository.findAll();


        model.addAttribute("users",Users);
        model.addAttribute("numPage",page.getTotalPages());
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("posts",page.getContent());
        model.addAttribute("currentPage", pageNo);
        return "Home/homePage";
    }

    @GetMapping(path = "/searchByCategory")
    public String searchByCategory(@RequestParam int id,Model model,@RequestParam(defaultValue = "0") int pageNo,@RequestParam(defaultValue = "10") int pageSize){
        return homeService.searchByCategory(id,model,pageNo,pageSize);
    }
}
