package com.cognizant.comparison.jpa.config;


import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class jpaUtil {
    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("jpa-unit");

    public static EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }

    public static void shutdown() {
        emf.close();
    }
}