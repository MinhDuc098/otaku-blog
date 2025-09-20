package com.example.demo.repositories;

import com.example.demo.model.Savepost;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface SavePostRepository extends JpaRepository<Savepost,Integer> {

    @Query("select savePost from Savepost savePost where savePost.user.userId = ?1 and savePost.post.postId = ?2")
    Savepost getSavepostByUserIdAndPostId(int userId, int postId);

    @Query("SELECT s  from Savepost s where s.user.userId = ?1 order by  s.createdAt desc")
    Page<Savepost> getSavedPost(int userId, Pageable pageable);
}
