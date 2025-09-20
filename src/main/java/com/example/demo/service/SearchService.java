package com.example.demo.service;

import com.example.demo.model.Category;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.repositories.CategoryRepository;
import com.example.demo.repositories.PostRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class SearchService {

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private UserRepository userRepository;


    public String search(HttpSession session, String name, int pageNo, int pageSize, Model model) {
        Pageable pageable = PageRequest.of(pageNo,pageSize);
        Page<Post> pagePost = postRepository.getAllPostByName(name,pageable);
        List<Category> listCategory = categoryRepository.findAll();
        List<User> Users = userRepository.findTop3ByOrderByNumberFollowerDesc();

        if(session.getAttribute("userID")!= null){
            User user = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();
            model.addAttribute("userNotify",user.getUserNotification());

            if((int)session.getAttribute("userAuthor") == 5){
                model.addAttribute("adminNotify",user.getAdminNotification());
            }
        }
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("users",Users);
        model.addAttribute("numPage",pagePost.getTotalPages());
        model.addAttribute("posts",pagePost.getContent());
        model.addAttribute("currentPage", pageNo);
        return "Home/homePage";
    }
}
