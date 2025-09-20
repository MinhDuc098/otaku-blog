package com.example.demo;

import com.example.demo.model.User;
import com.example.demo.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public AuthenticationManager authenticationManager() throws Exception {
        return new ProviderManager(Arrays.asList(authenticationProvider()));
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity security) throws Exception {
        security
                .authorizeHttpRequests()
                .requestMatchers("/home",
                        "/tologin", "/toforgotPassword", "/forgotPassword", "/logout"
                        , "/viewBlog", "/toAuthorBlog", "/searchByCategory",
                        "/search", "/register", "/style/**", "/img/**", "/js/**")
                .permitAll()
                .requestMatchers("/admin/**").hasAuthority("ADMIN")
                .anyRequest().authenticated()
                .and()


                .formLogin(form -> form
                        .loginPage("/tologin")          // GET login page
                        .loginProcessingUrl("/login")   // POST login form
                        .usernameParameter("email")     // we use email instead of username
                        .passwordParameter("password")
                        .failureHandler((request, response, exception) -> {
                            String message;
                            if (exception instanceof DisabledException) {
                                message = "You have been banned!";
                            } else if (exception instanceof BadCredentialsException) {
                                message = "Wrong email or password.";
                            } else if (exception instanceof UsernameNotFoundException) {
                                message = "Your account doesn't exist!";
                            } else {
                                message = "Login failed. Please try again.";
                            }
                            request.getSession().setAttribute("error_message", message);
                            response.sendRedirect("/tologin?error");
                        })
                        .successHandler((request, response, authentication) -> {
                            // After success, fetch user and set session attributes
                            User u = userRepository.findUserByUserEmail(authentication.getName());

                            HttpSession session = request.getSession();
                            session.setAttribute("userID", u.getUserId());
                            session.setAttribute("userName", u.getUserName());
                            session.setAttribute("email", u.getUserEmail());
                            session.setAttribute("userImg", u.getUserImg());
                            session.setAttribute("userAuthor", u.getUserAuthor());
                            // ❌ Do not save password

                            response.sendRedirect("/home");
                        })
                        .permitAll()
                )

                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/home")
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
