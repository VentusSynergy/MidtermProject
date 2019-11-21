package com.skilldistillery.jpanommpa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@EntityScan("com.skilldistillery.jpanommpa")
public class NomMealPlanArchitectApplication extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(NomMealPlanArchitectApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(NomMealPlanArchitectApplication.class, args);
	}

}
