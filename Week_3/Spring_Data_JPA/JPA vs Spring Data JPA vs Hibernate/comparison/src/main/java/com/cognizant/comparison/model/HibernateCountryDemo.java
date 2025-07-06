package com.cognizant.comparison.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class HibernateCountryDemo {

    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();

        Session session = factory.openSession();
        session.beginTransaction();

        List<Country> countries = session.createQuery("from Country", Country.class).getResultList();

        System.out.println("Result from Hibernate: " + countries);
        for (Country c : countries) {
            System.out.println(c);
        }

        session.getTransaction().commit();
        session.close();
        factory.close();
    }
}
