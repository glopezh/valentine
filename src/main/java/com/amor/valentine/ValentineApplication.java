package com.amor.valentine;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ValentineApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(ValentineApplication.class, args);
	}
	@Override
	public void run(String... args) throws Exception {
		System.out.println("**********************************************************");
		System.out.println("**                                                     **");
		System.out.println("**   Sergi, ¿Quieres ser mi Valentine? 💖               **");
		System.out.println("**                                                     **");
		System.out.println("**********************************************************");
	}

}
