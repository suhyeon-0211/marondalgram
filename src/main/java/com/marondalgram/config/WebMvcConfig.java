package com.marondalgram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///C:\\Users\\kitew\\박수현_java\\6.spring_project1\\quiz\\images/");
	}

}
