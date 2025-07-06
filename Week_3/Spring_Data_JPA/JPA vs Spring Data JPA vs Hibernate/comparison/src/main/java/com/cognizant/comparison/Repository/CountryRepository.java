package com.cognizant.comparison.Repository;

import com.cognizant.comparison.model.Country;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CountryRepository extends JpaRepository<Country, String> {
}
