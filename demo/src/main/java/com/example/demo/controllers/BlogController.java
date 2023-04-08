package com.example.demo.controllers;

import com.example.demo.model.Post;
import com.example.demo.service.BlogService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Set;

@Controller
@RequestMapping(path = "/")
public class BlogController {
    @Autowired
    private BlogService viewBlogService;

    @GetMapping(path = "/viewBlog")
    public String viewBlog(@RequestParam int id, Model model){
        return viewBlogService.viewPost(id,model);
    }


    @GetMapping(path = "/upvote")
    public String upvote(@RequestParam int id, RedirectAttributes attributes,HttpSession session){
        return viewBlogService.upvote(id,attributes,session);
    }

    @GetMapping(path = "/downvote")
    public String downvote(@RequestParam int id, RedirectAttributes attributes,HttpSession session){
        return viewBlogService.downvote(id,attributes,session);
    }

    @GetMapping(path = "/toWriteBlog")
    public String toWriteBlog(Model model, HttpSession session){
        return viewBlogService.toWriteBlog(model,session);
    }

    @PostMapping(path = "/addNewBlog")
    public String addNewBlog(Post post, RedirectAttributes attributes,@RequestParam("categories") Set<Integer> categories,HttpSession session){
        return viewBlogService.addNewBlog(post,attributes,categories,session);
    }

    @GetMapping(path = "/toYourBlog")
    public String toYourBlog(Model model, HttpSession session){
        return viewBlogService.toYourBlog( model,  session);
    }
}



