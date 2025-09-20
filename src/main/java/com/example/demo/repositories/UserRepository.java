package com.example.demo.repositories;

import com.example.demo.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    @Query("Select user from User user where user.userName = ?1 and user.userPassword = ?2")
    public User findByUser(String username, String password);

    @Query("Select user from User user where user.userEmail = ?1")
    public User findByEmail(String email);

    @Query("select user from User user order by user.userId")
    public Page<User> getAllUser(Pageable pageable);

    @Query("select user from User user where user.userAuthor = 5")
    public List<User> getAllAdmin();

    public List<User> findTop3ByOrderByNumberFollowerDesc();

    public User findUserByUserEmail(String email);

    @Query("select user from User user where user.userName like %?1% order by user.userId")
    public List<User> findUserByUserName(String userName);
}
