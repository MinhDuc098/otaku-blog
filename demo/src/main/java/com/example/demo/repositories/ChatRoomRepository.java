package com.example.demo.repositories;

import com.example.demo.model.Chatroom;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ChatRoomRepository extends JpaRepository<Chatroom,Integer> {

    public Chatroom findChatroomByUserSenderAndUserReceiver(User userSenderId, User UserReceiveId);
}
