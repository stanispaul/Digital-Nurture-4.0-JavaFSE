package com.cognizant.comparison.jpa.dao;

import com.cognizant.comparison.model.Country;
import com.cognizant.comparison.jpa.config.jpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;

public class CountryDao {

    public List<Country> getAllCountries() {
        EntityManager em = jpaUtil.getEntityManagerFactory().createEntityManager();
        List<Country> countries = em.createQuery("FROM Country", Country.class).getResultList();
        em.close();
        return countries;
    }
}
