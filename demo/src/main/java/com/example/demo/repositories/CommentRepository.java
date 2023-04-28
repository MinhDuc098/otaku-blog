package com.example.demo.repositories;

import com.example.demo.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment,Integer> {
    @Query("select comment from Comment comment where comment.post.postId = ?1 order by comment.createdAt")
    List<Comment> getCommentByPostId(int id);

}
