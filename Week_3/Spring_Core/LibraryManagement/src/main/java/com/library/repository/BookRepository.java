package com.library.repository;

import org.springframework.stereotype.Repository;

@Repository
public class BookRepository {
    public void repo(){
      System.out.println("BookRepository Called");
    }
}
