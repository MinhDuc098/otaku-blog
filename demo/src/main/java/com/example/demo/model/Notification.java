package com.example.demo.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "notification")
public class Notification {
    @Id
    @Column(name = "notification_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer notificationId;

    @Column(name = "notification_content")
    private String notificationContent;

//    @Column(name = "notification_receiver_id")
//    private Integer notificationReceiverId;


    @ManyToOne
    @JoinColumn(name = "notification_receiver_id")
    private User userReceiverNotification;

    @Column(name = "notification_link")
    private String notificationLink;


    @Column(name = "created_at")
    private LocalDateTime createdAt;

    public Integer getNotificationId() {
        return this.notificationId;
    }

    public void setNotificationId(Integer notificationId) {
        this.notificationId = notificationId;
    }

    public String getNotificationContent() {
        return this.notificationContent;
    }

    public void setNotificationContent(String notificationContent) {
        this.notificationContent = notificationContent;
    }

    public User getUserReceiverNotification() {
        return userReceiverNotification;
    }

    public void setUserReceiverNotification(User userReceiverNotification) {
        this.userReceiverNotification = userReceiverNotification;
    }

    public String getNotificationLink() {
        return this.notificationLink;
    }

    public void setNotificationLink(String notificationLink) {
        this.notificationLink = notificationLink;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
