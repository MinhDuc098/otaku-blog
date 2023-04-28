package com.example.demo.model;

//import jakarta.persistence.*;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Entity
@Table(name = "user")


public class User {
    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer userId;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "user_email")
    private String userEmail;

    @Column(name = "user_password")
    private String userPassword;

    @Column(name = "user_banned")
    private Integer userBanned;

    @Column(name = "user_author")
    private Integer userAuthor;

    @Column(name = "user_description")
    private String userDescription;

    @Column(name = "user_img")
        private String userImg;

    @Column(name = "user_date_of_birth")

    private LocalDateTime userDateOfBirth;

    @Column(name = "user_Notification")
    private int userNotification;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<Post> post = new HashSet<>();

    @OneToMany(mappedBy = "user",  cascade = CascadeType.ALL)
    private Set<Comment> comments = new HashSet<>();


    @OneToMany(mappedBy = "user",  cascade = CascadeType.ALL)
    private Set<Report> reports = new HashSet<>();


    @OneToMany(mappedBy = "reportingUser")
    private List<ReportUser> reportsMade;

    @OneToMany(mappedBy = "reportedUser")
    private List<ReportUser> reportsReceived;

    @OneToMany(mappedBy = "userReceiverNotification")
    private List<Notification> notifications;


    public Set<Report> getReports() {
        return reports;
    }

    public void setReports(Set<Report> reports) {
        this.reports = reports;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Integer getUserId() {
        return this.userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return this.userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return this.userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Integer getUserBanned() {
        return this.userBanned;
    }

    public void setUserBanned(Integer userBanned) {
        this.userBanned = userBanned;
    }

    public Integer getUserAuthor() {
        return this.userAuthor;
    }

    public void setUserAuthor(Integer userAuthor) {
        this.userAuthor = userAuthor;
    }

    public String getUserDescription() {
        return this.userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
    }

    public String getUserImg() {
        return this.userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public LocalDateTime  getUserDateOfBirth() {
        return this.userDateOfBirth;
    }

    public void setUserDateOfBirth(LocalDateTime  userDateOfBirth) {
        this.userDateOfBirth = userDateOfBirth;
    }

    public Set<Post> getPost() {
        return post;
    }

    public void setPost(Set<Post> post) {
        this.post = post;
    }

    public int getUserNotification() {
        return userNotification;
    }

    public void setUserNotification(int userNotification) {
        this.userNotification = userNotification;
    }

    public List<ReportUser> getReportsMade() {
        return reportsMade;
    }

    public void setReportsMade(List<ReportUser> reportsMade) {
        this.reportsMade = reportsMade;
    }

    public List<ReportUser> getReportsReceived() {
        return reportsReceived;
    }

    public void setReportsReceived(List<ReportUser> reportsReceived) {
        this.reportsReceived = reportsReceived;
    }

    public List<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }
}
