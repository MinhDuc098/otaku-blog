package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig {





    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public AuthenticationManager authenticationManager() throws Exception {
        return new ProviderManager(Arrays.asList(authenticationProvider()));
    }



    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity security) throws  Exception
    {
        security

                .authorizeHttpRequests()
                    .requestMatchers("/home",
                                    "/tologin","/toforgotPassword",
                                    "/login","/forgotPassword","/logout"
                                    ,"/viewBlog","/toAuthorBlog","/searchByCategory",
                                    "/search","/register","/style/**", "/img/**","/js/**")
                    .permitAll()
                    .requestMatchers("/admin/**").hasAuthority("ADMIN")
                    .anyRequest().authenticated()
                    .and()



                .formLogin()
                    .loginPage("/tologin")
                    .permitAll()
                    .and()

                .logout()
                    .logoutUrl("/logout")
                    .permitAll()
                    .and()

                .csrf().disable()
                .anonymous().disable();

        return security.build();
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailsService);
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }


}
