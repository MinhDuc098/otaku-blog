package com.example.demo.service;

import com.example.demo.model.Category;
import com.example.demo.model.Chatroom;
import com.example.demo.model.Message;
import com.example.demo.model.User;
import com.example.demo.repositories.CategoryRepository;
import com.example.demo.repositories.ChatRoomRepository;
import com.example.demo.repositories.MessageRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ChatService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ChatRoomRepository chatRoomRepository;

    @Autowired
    private MessageRepository messageRepository;

    public String searchUserByUserName(String userName, HttpSession session, Model model) {
        List<User> userFounds = userRepository.findUserByUserName(userName);
        List<Category> listCategory = categoryRepository.findAll();

        if(session.getAttribute("userID")!= null){
            User user = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();
            model.addAttribute("userNotify",user.getUserNotification());

            if((int)session.getAttribute("userAuthor") == 5){
                model.addAttribute("adminNotify",user.getAdminNotification());
            }
        }
        model.addAttribute("listCategory",listCategory);

        model.addAttribute("userFounds",userFounds);
        return "chat/chat";
    }

    public String tochat(HttpSession session, Model model) {
        List<Category> listCategory = categoryRepository.findAll();

        if(session.getAttribute("userID")!= null){
            User user = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();
            model.addAttribute("userNotify",user.getUserNotification());

            if((int)session.getAttribute("userAuthor") == 5){
                model.addAttribute("adminNotify",user.getAdminNotification());
            }
        }
        model.addAttribute("listCategory",listCategory);
        return "chat/chat";
    }

    public String selectUserChat(int userId, Model model,HttpSession session) {
        List<Category> listCategory = categoryRepository.findAll();

//        find user
       User userReiceiver = userRepository.findById(userId).orElseThrow();
//        set user notify

            User userSender = userRepository.findById((int)session.getAttribute("userID")).orElseThrow();
            model.addAttribute("userNotify",userSender.getUserNotification());

            if((int)session.getAttribute("userAuthor") == 5){
                model.addAttribute("adminNotify",userSender.getAdminNotification());
            }

            LocalDateTime now = LocalDateTime.now();
            Chatroom chatroom = new Chatroom();

//        get All message between you this this user
//        if userSender and userReceiver have not send any message yet
        if(chatRoomRepository.findChatroomByUserSenderAndUserReceiver(userSender,userReiceiver) == null){
            if(chatRoomRepository.findChatroomByUserSenderAndUserReceiver(userReiceiver,userSender)==null){
                Chatroom newChat = new Chatroom();
                newChat.setUserSender(userSender);
                newChat.setUserReceiver(userReiceiver);
                newChat.setCreatedAt(now);

                chatRoomRepository.save(newChat);
            }
            else{
                 chatroom = chatRoomRepository.findChatroomByUserSenderAndUserReceiver(userReiceiver,userSender);
            }
        }
        else{
             chatroom = chatRoomRepository.findChatroomByUserSenderAndUserReceiver(userSender,userReiceiver);

        }
        List<Message> messages = messageRepository.findMessageByChatroomId(chatroom.getChatRoomId());


        model.addAttribute("messages",messages);
        model.addAttribute("chatRoom", chatroom);
        model.addAttribute("listCategory",listCategory);
        model.addAttribute("userChat",userReiceiver);
        return "chat/chat";
    }
}
