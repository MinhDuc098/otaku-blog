package com.example.demo.controllers;

import com.example.demo.model.Chatroom;
import com.example.demo.model.Message;
import com.example.demo.repositories.ChatRoomRepository;
import com.example.demo.repositories.MessageRepository;
import com.example.demo.service.ChatService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDateTime;

@Controller

public class ChatController {
    @Autowired
    private ChatService chatService;

    @Autowired
    private ChatRoomRepository chatRoomRepository;

    @Autowired
    private MessageRepository messageRepository;


    @GetMapping(path = "/toChat")
    public String toChat(HttpSession session, Model model){

        return chatService.tochat(session,model);
    }


    @PostMapping(path = "/searchUserByUserName")
    public String searchUserByUserName(String userName ,HttpSession session, Model model){
        return chatService.searchUserByUserName(userName,session,model);

    }

    @GetMapping(path = "/selectUserChat")
    public String selectUserChat(int userId, Model model,HttpSession session){
        return chatService.selectUserChat(userId, model,session);
    }

    @MessageMapping("/chat.sendMessage/{chatRoomId}")
    @SendTo("/topic/chatroom/{chatRoomId}")
    public Message handleChatMessage(@DestinationVariable("chatRoomId") int chatRoomId,@Payload Message message){

        LocalDateTime now = LocalDateTime.now();
//
////        save mess to database
//
//
        message.setChatroomId(chatRoomId);
        message.setCreatedAt(now);
        messageRepository.save(message);

        return message;
    }
}
