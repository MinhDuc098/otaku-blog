package com.example.demo.service;

import com.example.demo.model.Comment;
import com.example.demo.model.Notification;
import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.repositories.CommentRepository;
import com.example.demo.repositories.NotificationRepository;
import com.example.demo.repositories.PostRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private NotificationRepository notificationRepository;

    public String addComment(Comment comment,int id, RedirectAttributes attributes, HttpSession session){
        if(session.getAttribute("userID") != null){
            LocalDateTime now = LocalDateTime.now();
            User authorComment = userRepository.findById((int) session.getAttribute("userID")).orElseThrow(() -> new EntityNotFoundException("user not found"));
            Post post = postRepository.findById(id).orElseThrow();

            comment.setPost(post);
            comment.setUser(authorComment);
            comment.setCreatedAt(now);
            commentRepository.save(comment);

            User userFollowing = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();

//            tạo notification
            String message = "người dùng "+ authorComment.getUserName()+ " đã bình luận vào bài viết "+ post.getPostTitle()  +" của bạn";
            Notification notification = new Notification();

            notification.setNotificationLink("./viewBlog(id ="+ id +")");
            notification.setCreatedAt(now);
            notification.setUserReceiverNotification(post.getUser());
            notification.setNotificationContent(message);
//          lưu vào datbase
            notificationRepository.save(notification);

            attributes.addAttribute("id",id);
            return "redirect:./viewBlog";
        }
        session.setAttribute("message","your session have been expired");
       return "Login/login";
    }
}
