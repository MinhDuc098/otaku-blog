package com.example.demo.controllers;

import com.example.demo.model.Comment;
import com.example.demo.service.CommentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(path = "/")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping(path = "/addComment")
    public String addComment(Comment comment,int id, RedirectAttributes attributes, HttpSession session){
        return commentService.addComment(comment,id,attributes,session);
    }
}
