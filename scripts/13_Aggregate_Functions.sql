/* ============================================================================== 
   SQL Aggregate Functions
-------------------------------------------------------------------------------
   This document provides an overview of SQL aggregate functions, which allow 
   performing calculations on multiple rows of data to generate summary results.

   Table of Contents:
     1. Basic Aggregate Functions
        - COUNT
        - SUM
        - AVG
        - MAX
        - MIN
     2. Grouped Aggregations
        - GROUP BY
=================================================================================
*/

/* ============================================================================== 
   BASIC AGGREGATE FUNCTIONS
=============================================================================== */

-- Find the total number of customers (including NULL value)
SELECT COUNT(*) AS total_customers
FROM customers
   
-- Find the total number of customers (excluding NULL value)
SELECT COUNT(customer_id) AS total_customers
FROM customers
   
-- Find the total sales of all orders
SELECT SUM(sales) AS total_sales
FROM orders

-- Find the average sales of all orders
SELECT AVG(sales) AS avg_sales
FROM orders

-- Find the highest score among customers
SELECT MAX(score) AS max_score
FROM customers

-- Find the lowest score among customers
SELECT MIN(score) AS min_score
FROM customers

/* ============================================================================== 
   GROUPED AGGREGATIONS - GROUP BY
=============================================================================== */

-- Find the number of orders, total sales, average sales, highest sales, and lowest sales per customer
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales,
    MAX(sales) AS highest_sales,
    MIN(sales) AS lowest_sales
FROM orders
GROUP BY customer_id

-- Find the number of new_orders, expired orders and total_orders in MULTIPLE rows
SELECT
    status,
    COUNT(*) AS status_count
FROM orders
GROUP BY status

/* ============================================================================== 
   CONDITIONAL AGGREGATIONS - with CASE WHEN statements
=============================================================================== */

-- Find the number of new_orders, expired orders and total_orders in SINGLE row
SELECT
    COUNT(CASE WHEN status = 'new' THEN order_id END) AS new_orders,
    COUNT(CASE WHEN status = 'expired' THEN order_id END) AS expired_orders,
    COUNT(*) AS total_orders
FROM orders
