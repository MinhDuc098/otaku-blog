package com.example.demo.service;

import com.example.demo.model.Category;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.repositories.CategoryRepository;
import com.example.demo.repositories.PostRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.persistence.EntityNotFoundException;
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

    public List<Post> getAllPost(){return postRepository.findAll();}

    public String searchByCategory(int id, Model model, int pageNo, int pageSize) {
        List<Category> listCategory = categoryRepository.findAll();

        Pageable pageable = PageRequest.of(pageNo, pageSize);
        Page<Post> page =  postRepository.getAllByCategory(id,pageable);

        List<User> Users = userRepository.findAll();

        model.addAttribute("users",Users);
        model.addAttribute("numPage",page.getTotalPages());
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("posts",page.getContent());
        model.addAttribute("currentPage", pageNo);
        return "Home/homePage";
    }

    public Page<Post> getPostByOffset(int pageNo, int pageSize){
        Pageable pageable = PageRequest.of(pageNo, pageSize);
        Page<Post> page = postRepository.getAllPost(pageable);
        return page;

    }

}
