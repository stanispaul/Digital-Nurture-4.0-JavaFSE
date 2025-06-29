--6383380
--Stanis Paul S

--Scenario 1: The bank wants to apply a discount to loan interest rates for customers above 60 years old.
--Question: Write a PL/SQL block that loops through all customers, checks their age, and if they are above 60, apply a 1% discount to their current loan interest rates.

--Create the Tables

CREATE TABLE customers (
    customer_id     NUMBER PRIMARY KEY,
    name            VARCHAR2(100),
    age             NUMBER,
    balance         NUMBER(10,2),
    is_vip          CHAR(1) DEFAULT 'N' 
);

CREATE TABLE loans (
    loan_id         NUMBER PRIMARY KEY,
    customer_id     NUMBER,
    interest_rate   NUMBER(5,2),
    due_date        DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--Insert Sample Data

-- Insert into customers
INSERT INTO customers VALUES (11, 'Arun Kumar',     68, 15500.00, 'VIP');  
INSERT INTO customers VALUES (12, 'Sneha Reddy',    43, 8700.00,  'NO'); 
INSERT INTO customers VALUES (13, 'Manoj Verma',    72, 11200.00, 'VIP'); 
INSERT INTO customers VALUES (14, 'Divya Shah',     29, 10750.00, 'VIP'); 
INSERT INTO customers VALUES (15, 'Ravi Iyer',      60, 4600.00,  'NO'); 


-- Insert into loans
INSERT INTO loans VALUES (201, 11, 8.2, SYSDATE + 7);
INSERT INTO loans VALUES (202, 12, 9.1, SYSDATE + 35);
INSERT INTO loans VALUES (203, 13, 7.3, SYSDATE + 28);
INSERT INTO loans VALUES (204, 14, 8.4, SYSDATE + 95); 
INSERT INTO loans VALUES (205, 15, 9.6, SYSDATE + 3); 



--Apply 1% Discount for Age > 60

BEGIN
    FOR cust_rec IN (
        SELECT c.customer_id, l.loan_id, l.interest_rate
        FROM customers c
        JOIN loans l ON c.customer_id = l.customer_id
        WHERE c.age > 60
    )
    LOOP
        UPDATE loans
        SET interest_rate = cust_rec.interest_rate - (cust_rec.interest_rate * 0.01)
        WHERE loan_id = cust_rec.loan_id;

    END LOOP;

    COMMIT;
END;

--OUTPUT

SELECT c.customer_id, c.name, c.age, l.loan_id, l.interest_rate
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
WHERE c.age > 60;

--Scenario 2: A customer can be promoted to VIP status based on their balance.
--Question: Write a PL/SQL block that iterates through all customers and sets a flag IsVIP to TRUE for those with a balance over $10,000.


--Create the Tables

CREATE TABLE customers (
    customer_id     NUMBER PRIMARY KEY,
    name            VARCHAR2(100),
    age             NUMBER,
    balance         NUMBER(10,2),
    is_vip          CHAR(1) DEFAULT 'N' 
);

CREATE TABLE loans (
    loan_id         NUMBER PRIMARY KEY,
    customer_id     NUMBER,
    interest_rate   NUMBER(5,2),
    due_date        DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--Insert Sample Data

-- Insert into customers
INSERT INTO customers VALUES (11, 'Arun Kumar',     68, 15500.00, 'VIP');  
INSERT INTO customers VALUES (12, 'Sneha Reddy',    43, 8700.00,  'NO'); 
INSERT INTO customers VALUES (13, 'Manoj Verma',    72, 11200.00, 'VIP'); 
INSERT INTO customers VALUES (14, 'Divya Shah',     29, 10750.00, 'VIP'); 
INSERT INTO customers VALUES (15, 'Ravi Iyer',      60, 4600.00,  'NO'); 


-- Insert into loans
INSERT INTO loans VALUES (201, 11, 8.2, SYSDATE + 7);
INSERT INTO loans VALUES (202, 12, 9.1, SYSDATE + 35);
INSERT INTO loans VALUES (203, 13, 7.3, SYSDATE + 28);
INSERT INTO loans VALUES (204, 14, 8.4, SYSDATE + 95); 
INSERT INTO loans VALUES (205, 15, 9.6, SYSDATE + 3); 


-- Promote customers to VIP status if their balance is over $10,000.

BEGIN
    FOR cust_rec IN (
        SELECT customer_id, balance
        FROM customers
        WHERE balance > 10000
    )
    LOOP
        UPDATE customers
        SET is_vip = 'Y'
        WHERE customer_id = cust_rec.customer_id;

        DBMS_OUTPUT.PUT_LINE('Customer ID ' || cust_rec.customer_id || 
                             ' promoted to VIP (Balance: ' || cust_rec.balance || ')');
    END LOOP;

    COMMIT;
END;

--OUTPUT

SELECT customer_id, name, balance, is_vip
FROM customers
WHERE is_vip = 'Y';


--Scenario 3: The bank wants to send reminders to customers whose loans are due within the next 30 days.
--Question: Write a PL/SQL block that fetches all loans due in the next 30 days and prints a reminder message for each customer.


--Create the Tables

CREATE TABLE customers (
    customer_id     NUMBER PRIMARY KEY,
    name            VARCHAR2(100),
    age             NUMBER,
    balance         NUMBER(10,2),
    is_vip          CHAR(1) DEFAULT 'N' 
);

CREATE TABLE loans (
    loan_id         NUMBER PRIMARY KEY,
    customer_id     NUMBER,
    interest_rate   NUMBER(5,2),
    due_date        DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--Insert Sample Data
-- Insert into customers
INSERT INTO customers VALUES (11, 'Arun Kumar',     68, 15500.00, 'VIP');  
INSERT INTO customers VALUES (12, 'Sneha Reddy',    43, 8700.00,  'NO'); 
INSERT INTO customers VALUES (13, 'Manoj Verma',    72, 11200.00, 'VIP'); 
INSERT INTO customers VALUES (14, 'Divya Shah',     29, 10750.00, 'VIP'); 
INSERT INTO customers VALUES (15, 'Ravi Iyer',      60, 4600.00,  'NO'); 

-- Insert into loans
INSERT INTO loans VALUES (201, 11, 8.2, SYSDATE + 7);
INSERT INTO loans VALUES (202, 12, 9.1, SYSDATE + 35);
INSERT INTO loans VALUES (203, 13, 7.3, SYSDATE + 28);
INSERT INTO loans VALUES (204, 14, 8.4, SYSDATE + 95); 
INSERT INTO loans VALUES (205, 15, 9.6, SYSDATE + 3); 



--Fetch loans due within the next 30 days and print reminder messages to the customers.

BEGIN
    FOR loan_rec IN (
        SELECT l.loan_id, l.due_date, c.customer_id, c.name
        FROM loans l
        JOIN customers c ON l.customer_id = c.customer_id
        WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear ' || loan_rec.name || 
            ', your loan (Loan ID: ' || loan_rec.loan_id || 
            ') is due on ' || TO_CHAR(loan_rec.due_date, 'DD-MON-YYYY') || '.'
        );
    END LOOP;
END;

--Output

SELECT 
    'Reminder: Dear ' || c.name || 
    ', your loan (Loan ID: ' || l.loan_id || 
    ') is due on ' || TO_CHAR(l.due_date, 'DD-MON-YYYY') || '.' AS reminder_message
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30;
