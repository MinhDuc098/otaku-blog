package com.example.demo.repositories;

import com.example.demo.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Integer> {

}
