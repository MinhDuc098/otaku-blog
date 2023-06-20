package com.example.demo.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "chatroom")
public class Chatroom {
    @Id
    @Column(name = "chat_room_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer chatRoomId;

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private User userSender;

    @ManyToOne
    @JoinColumn(name = "receiver_id")
    private User userReceiver;

    @Column(name = "created_at")
    private LocalDateTime createdAt;



    public Integer getChatRoomId() {
        return this.chatRoomId;
    }

    public void setChatRoomId(Integer chatRoomId) {
        this.chatRoomId = chatRoomId;
    }

    public User getUserSender() {
        return userSender;
    }

    public void setUserSender(User userSender) {
        this.userSender = userSender;
    }

    public User getUserReceiver() {
        return userReceiver;
    }

    public void setUserReceiver(User userReceiver) {
        this.userReceiver = userReceiver;
    }

    public LocalDateTime getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }


}
