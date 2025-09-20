package com.example.demo.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
@Entity
@Getter
@Setter
@Table(name = "vote")
public class Vote {
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "post_id")
    private Integer postId;

    @Column(name = "upvote")
    private String upvote;

    @Id
    @Column(name = "vote_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer voteId;

//    public Integer getUserId() {
//        return this.userId;
//    }
//
//    public void setUserId(Integer userId) {
//        this.userId = userId;
//    }
//
//    public Integer getPostId() {
//        return this.postId;
//    }
//
//    public void setPostId(Integer postId) {
//        this.postId = postId;
//    }
//
//    public String getUpvote() {
//        return this.upvote;
//    }
//
//    public void setUpvote(String upvote) {
//        this.upvote = upvote;
//    }
//
//    public Integer getVoteId() {
//        return this.voteId;
//    }
//
//    public void setVoteId(Integer voteId) {
//        this.voteId = voteId;
//    }
}
