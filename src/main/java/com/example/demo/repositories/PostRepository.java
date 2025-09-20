package com.example.demo.repositories;


import com.example.demo.model.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PostRepository extends JpaRepository<Post,Integer> {
    @Query(value = "SELECT post FROM Post post ORDER BY post.postId")
    Page<Post> getAllPost(Pageable pageable);

    @Query("SELECT p FROM Post p JOIN p.listCategory c WHERE c.categoryId = ?1 ORDER BY p.postId")
    Page<Post> getAllByCategory(int categoryId, Pageable pageable);

    @Query(value = "SELECT p from Post p JOIN p.user u where u.userId =?1")
    Page<Post> getAllPostByUser(int id,Pageable pageable);

    List<Post> findTop10ByOrderByUpVoteDesc();

    @Query(value = "SELECT post FROM Post post where post.postTitle like %?1% ORDER BY post.postId")
    Page<Post> getAllPostByName(String name, Pageable pageable);
}
