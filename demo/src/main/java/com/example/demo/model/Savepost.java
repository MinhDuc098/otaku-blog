package com.example.demo.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "savepost")
public class Savepost {
    @Id
    @Column(name = "save_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer saveId;

//    @Column(name = "userId")
//    private Integer userId;
//
//    @Column(name = "postId")
//    private Integer postId;


    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "post_id")
    private Post post;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    public Integer getSaveId() {
        return this.saveId;
    }

    public void setSaveId(Integer saveId) {
        this.saveId = saveId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public LocalDateTime getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
