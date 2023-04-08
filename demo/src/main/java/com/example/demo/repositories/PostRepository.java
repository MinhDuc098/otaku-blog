package com.example.demo.repositories;


import com.example.demo.model.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PostRepository extends JpaRepository<Post,Integer> {
    @Query(value = "SELECT post FROM Post post ORDER BY post.postId")
    Page<Post> getAllPost(Pageable pageable);

    @Query(value = "SELECT category.listPost from Category category where category.categoryId =?1")
    Page<Post> getAllByCategory(int id,Pageable pageable);
}
