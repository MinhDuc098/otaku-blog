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
    public String viewBlog(@RequestParam int id,Model model,HttpSession session){
        return viewBlogService.viewPost(id,model,session);
    }


    @GetMapping(path = "/upvote")
    public String upvote(@RequestParam int id , RedirectAttributes attributes,HttpSession session,Model model){
        return viewBlogService.upvote(id,attributes,session,model);
    }

    @GetMapping(path = "/downvote")
    public String downvote(@RequestParam int id , RedirectAttributes attributes,HttpSession session,Model model){
        return viewBlogService.downvote(id,attributes,session,model);
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
    public String toYourBlog(Model model, HttpSession session, @RequestParam(defaultValue = "0") int pageNo, @RequestParam(defaultValue = "3") int pageSize){
        return viewBlogService.toYourBlog( model, session,pageNo,pageSize);
    }

    @GetMapping(path = "/deleteYourPost")
    public String deleteYourPost(@RequestParam int id,HttpSession session){
        return viewBlogService.deleteYourPost(id,session);
    }

    @GetMapping(path = "/toAuthorBlog")
    public String toAuthorBlog(@RequestParam int authorId,Model model, @RequestParam(defaultValue = "0") int pageNo, @RequestParam(defaultValue = "10") int pageSize,HttpSession session){

        return viewBlogService.toAuthorBlog(authorId,model,pageNo,pageSize,session);
    }

    @PostMapping(path = "/ReportPost")
    public String toReportPost(int id,String reason, HttpSession session, Model model,RedirectAttributes attributes ){
        return viewBlogService.ReportPost(id,reason,session,model,attributes);
    }

    @GetMapping(path = "/savePost")
    public String savePost(int postId, HttpSession session, RedirectAttributes attributes){
        return viewBlogService.savePost(postId,session,attributes);
    }


    @GetMapping(path = "/toSavedPost")
    public String toSavedPost(HttpSession session, Model model ,  @RequestParam(defaultValue = "0") int pageNo, @RequestParam(defaultValue = "10") int pageSize){
        return viewBlogService.toSavedPost(session, model,pageNo,pageSize);
    }

    @GetMapping(path = "/removeSavedPost")
    public String removeSavedPost(int id, HttpSession session, RedirectAttributes attributes){
        return viewBlogService.removeSavedPost(id,session, attributes);
    }

}



