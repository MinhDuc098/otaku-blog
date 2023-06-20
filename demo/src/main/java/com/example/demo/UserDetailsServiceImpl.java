package com.example.demo;

import com.example.demo.model.User;
import com.example.demo.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private  UserRepository userRepository;


    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // Retrieve user details from your user repository or database using email
        User user = userRepository.findByEmail(email);

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

        if (user.getUserAuthor() == 5) {
            grantedAuthorities.add(new SimpleGrantedAuthority("ADMIN"));
        } else {
            grantedAuthorities.add(new SimpleGrantedAuthority("USER"));
        }


        // Create a UserDetails object based on the retrieved user details
        return org.springframework.security.core.userdetails.User.builder()
                .username(user.getUserEmail())
                .password(user.getUserPassword()) // Make sure the stored password is already encoded
                .authorities(grantedAuthorities)
                .build();
    }
}