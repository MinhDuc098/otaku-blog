package com.example.demo.service;

import com.example.demo.EmailSenderService;
import com.example.demo.model.User;
import com.example.demo.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class LoginService {
    @Autowired
    private UserRepository UserRepository;

    @Autowired
    private EmailSenderService emailSenderService;

    @Autowired
    public BCryptPasswordEncoder bCryptPasswordEncoder;



    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private AuthenticationProvider authenticationProvider;

    public String login(String email, String password, HttpSession session){
       final User u =  UserRepository.findUserByUserEmail(email);
       if(u != null){


               if(bCryptPasswordEncoder.matches(password,u.getUserPassword())){
                   if(u.getUserBanned()==0) {
                       session.setAttribute("email", u.getUserEmail());
                       session.setAttribute("userID", u.getUserId());
                       session.setAttribute("userName", u.getUserName());
                       session.setAttribute("userPass", u.getUserPassword());
                       session.setAttribute("userImg", u.getUserImg());
                       session.setAttribute("userAuthor", u.getUserAuthor());

                       Authentication authenticationToken = new UsernamePasswordAuthenticationToken(email, password);


                       // Authenticate the token using the AuthenticationProvider
                       Authentication authenticationResult = authenticationProvider.authenticate(authenticationToken);

                       // Set the authenticated authentication object to the security context
                       SecurityContextHolder.getContext().setAuthentication(authenticationResult);


                       session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());


                       return "redirect:./home";
                   }
                   else {
                       session.setAttribute("message","You have been banned ");
                       return "Login/login";
                   }
               }
               else{
                   session.setAttribute("message","Wrong password");

                   return "Login/login";
               }

       }
       if(u == null){
            session.setAttribute("message","Your Account Doesn't Exist!");

            return "Login/login";
       }
       return "redirect:./home";

    }

    public String forgotPassword(String email,HttpSession session){
        User u = UserRepository.findByEmail(email);
        if(u==null){
            session.setAttribute("mess1", "your account doesn't exist");
            return "Login/ForgotPassword";
        }
//        gen new password
        String password = genPassword();
        while(UserRepository.findByUser(u.getUserName(),password)!=null){
            password = genPassword();
        }

//        save password to database
        u.setUserPassword(bCryptPasswordEncoder.encode(password));
        UserRepository.save(u);

        emailSenderService.sendMail(email,"Your Password", password);
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
