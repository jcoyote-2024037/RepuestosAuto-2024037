package com.diegocoyote.tienda;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class RepuestosAutomotricesFinalProyectApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(RepuestosAutomotricesFinalProyectApplication .class, args);
	}

    @Override
    public void run(String... args) throws Exception {
        System.out.println("API FUNCIONANDO");
    }
}
