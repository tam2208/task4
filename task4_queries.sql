-- 1. Total Orders
SELECT COUNT(*) AS total_orders FROM orders;

-- 2. Total Revenue
SELECT SUM(price + freight_value) AS total_revenue FROM order_items;

-- 3. Average Order Value
SELECT AVG(price + freight_value) AS avg_order_value FROM order_items;

-- 4. Orders by Payment Type
SELECT payment_type, COUNT(*) AS count FROM order_payments GROUP BY payment_type;

-- 5. Top 5 States by Number of Customers
SELECT customer_state, COUNT(*) AS num_customers 
FROM customers 
GROUP BY customer_state 
ORDER BY num_customers DESC 
LIMIT 5;

-- 6. Top 5 Selling Products
SELECT product_id, COUNT(*) AS units_sold 
FROM order_items 
GROUP BY product_id 
ORDER BY units_sold DESC 
LIMIT 5;

-- 7. Create View: Monthly Revenue
CREATE VIEW monthly_revenue AS
SELECT strftime('%Y-%m', orders.order_purchase_timestamp) AS month,
       SUM(order_items.price + order_items.freight_value) AS revenue
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY month;
