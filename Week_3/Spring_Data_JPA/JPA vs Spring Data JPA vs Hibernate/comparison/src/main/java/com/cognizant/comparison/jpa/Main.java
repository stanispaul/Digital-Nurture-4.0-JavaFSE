package com.cognizant.comparison.jpa;

import com.cognizant.comparison.jpa.dao.CountryDao;
import com.cognizant.comparison.model.Country;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        CountryDao dao = new CountryDao();
        List<Country> list = dao.getAllCountries();
        System.out.println("Result from JPA");
        list.forEach(System.out::println);
    }
}
