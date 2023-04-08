package com.example.demo.repositories;

import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;




@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    @Query("Select user from User user where user.userName = ?1 and user.userPassword = ?2")
    public User findByUser(String username, String password);
    @Query("Select user from User user where user.userEmail = ?1")
    public User findByEmail(String email);
}
