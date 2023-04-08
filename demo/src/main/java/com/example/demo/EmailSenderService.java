package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import java.util.Properties;

@Service
public class EmailSenderService  {


    @Autowired
    public JavaMailSender javaMailSender;

    public void sendMail(String receiverEmail, String subject, String body){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("NguyenDuc098660@gmail.com");
        message.setTo(receiverEmail);
        message.setText(body);
        message.setSubject(subject);

        javaMailSender.send(message);
    }
}
