package com.example.demo.service;

import com.example.demo.model.Follow;
import com.example.demo.model.Notification;
import com.example.demo.model.User;
import com.example.demo.repositories.FollowRepository;
import com.example.demo.repositories.NotificationRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.swing.text.html.Option;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class FollowService {

    @Autowired
    private FollowRepository followRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private NotificationRepository notificationRepository;

    public String follow(int userid,String link ,HttpSession session, RedirectAttributes attributes) {
        if(session.getAttribute("userID")!=null){
            Follow follow = followRepository.getFollow(userid,(int)session.getAttribute("userID"));


            if(follow == null){
                Follow f = new Follow();
                f.setFollowerId((int)session.getAttribute("userID"));
                f.setUserId(userid);
                followRepository.save(f);

                User userFollowed = userRepository.findById(userid).orElseThrow();
                User userFollowing = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();

                String message = "người dùng "+ userFollowing.getUserName()+ " đã follow bạn";
                LocalDateTime now = LocalDateTime.now();
                Notification notification = new Notification();

                notification.setCreatedAt(now);
                notification.setUserReceiverNotification(userFollowed);
                notification.setNotificationContent(message);

                notificationRepository.save(notification);

            }
            else{
                followRepository.delete(follow);

            }
            return "redirect:"+link;
        }
        session.setAttribute("message","You have to login to do first");
        return "Login/login";
    }
}