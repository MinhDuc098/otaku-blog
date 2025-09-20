package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "follow")
public class Follow {
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "follower_id")
    private Integer followerId;

    @Id
    @Column(name = "follow_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer followId;

    public Integer getUserId() {
        return this.userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getFollowerId() {
        return this.followerId;
    }

    public void setFollowerId(Integer followerId) {
        this.followerId = followerId;
    }

    public Integer getFollowId() {
        return this.followId;
    }

    public void setFollowId(Integer followId) {
        this.followId = followId;
    }
}
