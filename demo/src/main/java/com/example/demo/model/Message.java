package com.example.demo.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "message")
public class Message {
    @Id
    @Column(name = "message_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer messageId;

    @Column(name = "message_content")
    private String messageContent;

    @Column(name = "created_at")
    private LocalDateTime createdAt;



    @Column(name = "chat_room_id")
    private int chatroomId;

    @Column(name = "sender_id")
    private Integer senderId;

    public Integer getMessageId() {
        return this.messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getMessageContent() {
        return this.messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public LocalDateTime getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public int getChatroomId() {
        return chatroomId;
    }

    public void setChatroomId(int chatroomId) {
        this.chatroomId = chatroomId;
    }

    public Integer getSenderId() {
        return this.senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }
}
