package com.example.demo.repositories;

import com.example.demo.model.Follow;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface FollowRepository extends JpaRepository<Follow,Integer> {

    @Query("select follow from Follow follow where follow.userId = ?1 and follow.followerId = ?2")
    public Follow getFollow(int userId, int followerId);

    @Query("select follow.followerId from Follow follow where follow.userId= ?1")
    public List<Integer> getFollowerId(int userId);

    @Query("select follow.userId from Follow follow where follow.followerId= ?1")
    public List<Integer> getUserFollowed(int followerId);
}
