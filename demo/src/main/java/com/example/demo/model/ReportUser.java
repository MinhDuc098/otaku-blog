package com.example.demo.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "report_user")
public class ReportUser {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

//    @Column(name = "user_report")
//    private Integer userReport;
//
//    @Column(name = "user_be_report")
//    private Integer userBeReport;

    @ManyToOne
    @JoinColumn(name = "user_report")
    private User reportingUser;


    @ManyToOne
    @JoinColumn(name = "user_be_report")
    private User reportedUser;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "reason")
    private String reason;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getReportingUser() {
        return reportingUser;
    }

    public void setReportingUser(User reportingUser) {
        this.reportingUser = reportingUser;
    }

    public User getReportedUser() {
        return reportedUser;
    }

    public void setReportedUser(User reportedUser) {
        this.reportedUser = reportedUser;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
