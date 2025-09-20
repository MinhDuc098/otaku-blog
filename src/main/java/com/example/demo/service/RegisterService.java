package com.example.demo.service;

//import com.example.demo.EmailSenderService;
import com.example.demo.EmailSenderService;
import com.example.demo.model.User;
import com.example.demo.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class RegisterService {
    @Autowired
    public UserRepository userRepository;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private EmailSenderService emailSenderService;
    public String register(String email, String username, HttpSession session) {

        if(userRepository.findByEmail(email)!=null){
                session.setAttribute("mess", "your email has been used");
                session.setAttribute("message", "your email has been used");
                return "Login/login";
        }

        String password = genPassword();
        while(userRepository.findByUser(username,password)!=null){
            password = genPassword();
        }

        emailSenderService.sendMail(email,"YOUR PASSWORD:","here is your password "+password);
        User u = new User();
                u.setUserName(username);
                u.setUserPassword(bCryptPasswordEncoder.encode(password));
                u.setUserEmail(email);
                u.setUserAuthor(1);
                u.setUserImg("/img/alexia.jpg");
                u.setUserBanned(0);
        userRepository.save(u);
        return "Login/login";


    }
    public String genPassword(){
        int leftLimit = 48; // numeral '0'
        int rightLimit = 122; // letter 'z'
        int targetStringLength = 10;
        Random random = new Random();

        String generatedString = random.ints(leftLimit, rightLimit + 1)
                .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                .limit(targetStringLength)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();
        return generatedString;
    }
}
