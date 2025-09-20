package com.example.demo.repositories;

import com.example.demo.model.ReportUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportUserRepository extends JpaRepository<ReportUser,Integer> {
    public List<ReportUser> findAllByOrderByCreatedAtDesc();
}
