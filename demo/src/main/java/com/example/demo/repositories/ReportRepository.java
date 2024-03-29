package com.example.demo.repositories;

import com.example.demo.model.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<Report,Integer> {
    List<Report> findAllByOrderByCreatedAtDesc();
}
