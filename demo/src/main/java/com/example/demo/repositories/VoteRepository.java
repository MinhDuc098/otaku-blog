package com.example.demo.repositories;

import com.example.demo.model.Vote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface VoteRepository extends JpaRepository<Vote,Integer> {
    @Query("select vote from Vote vote where vote.userId = ?1 and vote.postId= ?2")
    Vote getVoteByUserPost(int userId, int postId);
}
