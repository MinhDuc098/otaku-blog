package com.example.demo.repositories;

import com.example.demo.model.Chatroom;
import com.example.demo.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message,Integer> {
    public List<Message> findMessageByChatroomId(int chatroomId);
}
