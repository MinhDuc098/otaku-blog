package com.example.demo;

import com.cloudinary.Cloudinary;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
public class CloudinaryConfig {

    @Bean
    @Primary
    public Cloudinary cloudinary() {

        Cloudinary cloudinary = new Cloudinary(Cloudinary.asMap(
                "cloud_name", "dgslqultw",
                "api_key", "552511698686366",
                "api_secret", "Y9U0BkXNx8-nvlI-z4db0G6smus"));
        return cloudinary;
    }
}