package com.cognizant.comparison;

import com.cognizant.comparison.CountryService.CountryService;
import com.cognizant.comparison.model.Country;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.List;

@SpringBootApplication
public class OrmLearnApplication {

    private static final Logger LOGGER = (Logger) LoggerFactory.getLogger(OrmLearnApplication.class);

    @Autowired
    private CountryService countryService;

    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(OrmLearnApplication.class, args);
        OrmLearnApplication app = context.getBean(OrmLearnApplication.class);
        System.out.println("Result From Spring Data JPA");
        app.testSpringDataJpa();
    }

    public void testSpringDataJpa() {
        LOGGER.info(" Result from Spring Data JPA:");
        List<Country> countries = countryService.getAllCountries();
        countries.forEach(System.out::println);
    }
}
