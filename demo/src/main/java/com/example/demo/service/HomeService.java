package com.example.demo.service;

import com.example.demo.model.Category;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.repositories.CategoryRepository;
import com.example.demo.repositories.PostRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Set;

@Service
public class HomeService {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private PostRepository postRepository;

    @Autowired
    private UserRepository userRepository;

    public List<Category> getListCategory(){
        return categoryRepository.findAll();
    }

    public List<Post> getAllPost(){
        return postRepository.findTop10ByOrderByUpVoteDesc();
    }

    public String searchByCategory(HttpSession session, int id, Model model, int pageNo, int pageSize) {
        List<Category> listCategory = categoryRepository.findAll();
        Category category = categoryRepository.findById(id).orElseThrow(()->new EntityNotFoundException("no exist"));
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        Page<Post> page =  postRepository.getAllByCategory(id,pageable);

        List<User> Users = userRepository.findTop3ByOrderByNumberFollowerDesc();

        if(page.getContent() == null){
            model.addAttribute("Content","none");
        }

        if(session.getAttribute("userID")!= null){
            User user = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();
            model.addAttribute("userNotify",user.getUserNotification());

            if((int)session.getAttribute("userAuthor") == 5){
                model.addAttribute("adminNotify",user.getAdminNotification());
            }
        }

        model.addAttribute("users",Users);
        model.addAttribute("numPage",page.getTotalPages());
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("posts",page.getContent());
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("category",category.getCategoryName());
        model.addAttribute("categoryId",category.getCategoryId());
        return "Home/homePage";
    }

    public Page<Post> getPostByOffset(int pageNo, int pageSize){
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        Page<Post> page = postRepository.getAllPost(pageable);
        return page;

    }

}
