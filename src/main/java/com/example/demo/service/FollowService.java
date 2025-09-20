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

import java.time.LocalDateTime;

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

//              sent notification to user
                User userFollowed = userRepository.findById(userid).orElseThrow();
                User userFollowing = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();

                String message = "người dùng "+ userFollowing.getUserName()+ " đã follow bạn";
                LocalDateTime now = LocalDateTime.now();
                Notification notification = new Notification();

                notification.setCreatedAt(now);
                notification.setUserReceiverNotification(userFollowed);
                notification.setNotificationContent(message);
                notification.setUserRelate(userFollowing);

//              save notification
                notificationRepository.save(notification);
                userFollowed.setNumberFollower(userFollowed.getNumberFollower()+1);
                userFollowed.setUserNotification(userFollowed.getUserNotification()+1);

            }
            else{
                followRepository.delete(follow);
                User userFollowed = userRepository.findById(userid).orElseThrow();
                userFollowed.setNumberFollower(userFollowed.getNumberFollower()-1);
            }
            return "redirect:"+link;
        }
        session.setAttribute("message","You have to login to do first");
        return "Login/login";
    }
}
