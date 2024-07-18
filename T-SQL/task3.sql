USE BikeStores;

-- inner join
--task 1
SELECT pp.product_name, pc.category_name, pb.brand_name from production.products pp 
JOIN production.categories pc ON pp.product_id = pc.category_id 
JOIN production.brands pb ON pp.brand_id = pb.brand_id;

--task 2
SELECT pp.product_name, SUM(oit.quantity) from production.products pp 
JOIN sales.order_items oit on pp.product_id = oit.product_id 
GROUP BY pp.product_name;

--task 3

SELECT CONCAT(c.first_name, ' ', c.last_name) as customer_name, s.store_name 
from sales.customers c JOIN sales.orders o ON c.customer_id = o.customer_id
JOIN sales.stores s ON o.store_id = s.store_id;

--task 4

SELECT s.store_name, SUM(iot.quantity * iot.list_price) as total_sales 
from sales.stores s JOIN sales.orders o ON s.store_id = o.store_id
JOIN sales.order_items iot ON o.order_id = iot.order_id
GROUP BY s.store_name;

--task 5
SELECT CONCAT(c.first_name, ' ', c.last_name) , o.* from sales.customers c 
JOIN sales.orders o ON c.customer_id = o.customer_id;

--task 6
SELECT pp.product_name from production.products pp JOIN sales.order_items oit
ON pp.product_id = oit.product_id
WHERE oit.product_id IS NULL;

--task 7
SELECT c.category_name, AVG(pp.list_price) as avg_price from production.categories c
JOIN production.products pp ON c.category_id = pp.category_id
GROUP BY c.category_name;

--task 8
SELECT pp.product_name, SUM(ps.quantity) as total_stocks_quantity 
from production.products pp JOIN production.stocks ps ON pp.product_id = ps.product_id
GROUP BY pp.product_name;

--task 9  ---
SELECT CONCAT(c.first_name, ' ', c.last_name) as customer_name, COUNT( o.order_id) as total_orders
FROM sales.customers c JOIN sales.orders o ON c.customer_id = o.customer_id;


--task 10  
SELECT s.store_name, COUNT(DISTINCT oit.product_id) as total_products_sold
FROM sales.stores s JOIN sales.orders o ON s.store_id = o.store_id
JOIN sales.order_items oit ON o.order_id = oit.order_id
GROUP BY s.store_name;

-- Left join
--task 1
SELECT pp.product_name, pc.category_name 
from production.products pp  JOIN production.categories pc ON pp.category_id = pc.category_id;

--task 2
SELECT pp.product_name, SUM(oit.quantity) as total_quantity
FROM production.products pp LEFT JOIN sales.order_items oit ON pp.product_id = oit.product_id
GROUP BY pp.product_name;

--task 3 ---
SELECT CONCAT(c.first_name, ' ', c.last_name) as customer_name, pp.product_name, pp.product_id
FROM sales.customers c LEFT JOIN sales.orders o ON c.customer_id = o.customer_id
LEFT JOIN sales.order_items oit ON o.order_id = oit.order_id
LEFT JOIN production.products pp ON oit.product_id = pp.product_id;

--task 4
SELECT CONCAT(sm.first_name, ' ', sm.last_name) as staff_name, s.store_name
FROM sales.staffs sm LEFT JOIN sales.stores s ON sm.store_id = s.store_id;

--task 5 ---


--task 6 --


-- self join
--task 1
SELECT CONCAT(st.first_name, ' ', st.last_name) as staff_name, CONCAT(sm.first_name, ' ', sm.last_name) as manager_name
FROM sales.staffs st LEFT JOIN sales.staffs sm ON st.manager_id = sm.staff_id;


