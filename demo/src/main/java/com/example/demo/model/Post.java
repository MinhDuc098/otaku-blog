package com.example.demo.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "post")
public class Post {
    @Id
    @Column(name = "post_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer postId;

    @Column(name = "post_title")
    private String postTitle;

    @Column(name = "post_content")
    private String postContent;

    @Column(name = "up_vote")
    private Integer upVote;

    @Column(name = "down_vote")
    private Integer downVote;

//    @Column(name = "user_id")
//    private Integer userId;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private java.sql.Timestamp updatedAt;

    @Column(name = "summary")
    private String summary;

    @Column(name = "post_img")
    private String postImg;



    @ManyToMany
    @JoinTable(
            name = "cate_post",
            joinColumns = @JoinColumn(name = "post_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id")
    )

    private Set<Category> listCategory = new HashSet<>();


    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Set<Category> getListCategory() {
        return listCategory;
    }

    public void setListCategory(Set<Category> listCategory) {
        this.listCategory = listCategory;
    }

    public Integer getPostId() {
        return this.postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getPostTitle() {
        return this.postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String  getPostContent() {
        return this.postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public Integer getUpVote() {
        return this.upVote;
    }

    public void setUpVote(Integer upVote) {
        this.upVote = upVote;
    }

    public Integer getDownVote() {
        return this.downVote;
    }

    public void setDownVote(Integer downVote) {
        this.downVote = downVote;
    }

//    public Integer getUserId() {
//        return this.userId;
//    }
//
//    public void setUserId(Integer userId) {
//        this.userId = userId;
//    }

    public LocalDateTime getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public java.sql.Timestamp getUpdatedAt() {
        return this.updatedAt;
    }

    public void setUpdatedAt(java.sql.Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getPostImg() {
        return postImg;
    }

    public void setPostImg(String postImg) {
        this.postImg = postImg;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
