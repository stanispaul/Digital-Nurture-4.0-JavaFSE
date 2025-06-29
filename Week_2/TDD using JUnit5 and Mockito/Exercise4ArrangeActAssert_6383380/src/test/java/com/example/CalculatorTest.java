package com.example;

import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        // Arrange: This runs before each test
        calculator = new Calculator();
        System.out.println("Setup: Calculator initialized");
    }

    @After
    public void tearDown() {
        // Cleanup after each test
        calculator = null;
        System.out.println("Teardown: Calculator cleared");
    }

    @Test
    public void testAdd() {
        // Arrange is handled in setUp()
        int a = 10;
        int b = 20;

        // Act
        int result = calculator.add(a, b);

        // Assert
        assertEquals(30, result);
    }

    @Test
    public void testMultiply() {
        // Arrange is handled in setUp()
        int a = 4;
        int b = 5;

        // Act
        int result = calculator.multiply(a, b);

        // Assert
        assertEquals(20, result);
    }
}
