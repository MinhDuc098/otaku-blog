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

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

import java.util.HashSet;
import java.util.List;

import java.util.Set;
import java.util.regex.Pattern;

@Service
public class BlogService {
    @Autowired
    private PostRepository postRepository;
    @Autowired
    private HomeService homeService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    public String viewPost(int id, Model model){
        List<Category> listCategory = homeService.getListCategory();
        Post post = postRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Post not found"));

        User user = userRepository.findById(post.getUser().getUserId()).orElseThrow(() -> new EntityNotFoundException("user not found"));

        int vote = post.getUpVote() - post.getDownVote();

        if(containsHtmlTags(post.getPostContent())){
            model.addAttribute("contentHtml", post.getPostContent());
        }
        if(!containsHtmlTags(post.getPostContent())){
            model.addAttribute("contentText",post.getPostContent());
        }
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("post",post);
        model.addAttribute("user",user);
        model.addAttribute("vote",vote);
        return "ReadBlog/readBlog";
    }

    public static boolean containsHtmlTags(String input) {
        Pattern pattern = Pattern.compile("<[^>]*>");
        return pattern.matcher(input).find();
    }


    public String upvote(int id, RedirectAttributes attributes,HttpSession session){
        if(session.getAttribute("userID")!=null) {
            Post post = postRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Post not found"));
            post.setUpVote(post.getUpVote() + 1);
            postRepository.save(post);
            attributes.addAttribute("id", id);
            return "redirect:./viewBlog";
        }
        session.setAttribute("message","you have to login to use that function");
        return "redirect:./tologin";
    }


    public String downvote(int id, RedirectAttributes attributes,HttpSession session){
        if(session.getAttribute("userID")!=null) {
            Post post = postRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Post not found"));
            post.setDownVote(post.getDownVote() + 1);
            postRepository.save(post);
            attributes.addAttribute("id", id);
            return "redirect:./viewBlog";
        }
        session.setAttribute("message","you have to login to use that function");
        return "redirect:./tologin";
    }

    public String toWriteBlog(Model model, HttpSession session) {

        if(session.getAttribute("userID")!=null){
            Post p = new Post();
//            int userid = (int)session.getAttribute("userID");
//            User user = userRepository.findById(userid).orElseThrow(()-> new EntityNotFoundException(""));
//
//            p.setUser(user);
            p.setDownVote(0);
            p.setUpVote(0);
            List<Category> listCategory = homeService.getListCategory();
            model.addAttribute("listCategory",listCategory);
            model.addAttribute("Blog", p);

            return "WriteBlog/rich_tech_editor";
        }
        session.setAttribute("message","you have to login to use that function");
        return "redirect:./tologin";

    }

    public String addNewBlog(Post post,RedirectAttributes attributes,Set<Integer> categories,HttpSession session) {
        LocalDateTime now = LocalDateTime.now();

        Post p = new Post();
        List<Category> list = categoryRepository.findAllById(categories);
        Set<Category> lc = new HashSet<>(list);


        int userid = (int)session.getAttribute("userID");
        User user = userRepository.findById(userid).orElseThrow(()-> new EntityNotFoundException(""));

        p.setUser(user);
        p.setCreatedAt(now);
        p.setUpVote(post.getUpVote());
        p.setDownVote(post.getDownVote());
        p.setPostTitle(post.getPostTitle());
        p.setPostContent(post.getPostContent());
        p.setSummary(post.getSummary());
        p.setListCategory(lc);
        if(post.getPostImg() == null){
            p.setPostImg("/img/tohsaka.jpg");
        }
        else{
            p.setPostImg(post.getPostImg());
        }


        postRepository.save(p);

        return "redirect:/home";
    }

    public String toYourBlog(Model model, HttpSession session) {
        if(session.getAttribute("userID") != null){

            List<Category> listCategory = categoryRepository.findAll();
            User user = userRepository.findById((int)session.getAttribute("userID")).orElseThrow(()-> new EntityNotFoundException("not found user"));
            Set<Post> userPost = user.getPost();

            model.addAttribute("user",user);
;            model.addAttribute("listCategory",listCategory);
            model.addAttribute("userPost",userPost);
        }
        else {
            session.setAttribute("message","You have to login to do first");
            return "Login/login";
        }

        return "ManageYourBlog/listBlog";
    }
}
