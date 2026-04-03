#1
SELECT 
    store_name, SUM(quantity) 'total quantity'
FROM
    orders
        JOIN
    order_items USING (order_id)
        JOIN
    stores USING (store_id)
GROUP BY store_name;

#2
SELECT 
    product_name,
    order_date,
    quantity,
    SUM(quantity) over(partition by product_name order by order_date) "cumulative sum"
 FROM
 orders join 
    order_items using (order_id)
        JOIN
    products USING (product_id);
    
##3
with t as (
        select
        category_id,
		category_name,
        product_name,
		sum((products.list_price - discount) * quantity ) "total_sales"
    from
      products
    join 
	  categories 
    using (category_id)
    join 
	  order_items 
    using (product_id) 
    group by
      category_id,
      category_name,
      product_name
), 
t2 as (
select 
	*,
    max(total_sales) over (partition by category_id) highest_sales 
from
    t)
select 
    * 
    from t2
     where total_sales = highest_sales;
     
##4

with t as(
SELECT 
    customer_id,
    concat(first_name , last_name) as full_name,
    sum((list_price - discount) * quantity) as total_sales
FROM
    customers
        JOIN
    orders USING (customer_id)
        JOIN
    order_items USING (order_id)
    group by 
    customer_id,
    full_name
    )
    select 
    *
    from t
    where 
    total_sales = (select max(total_sales) from t);
    
    ##5
    
    WITH t AS (
    SELECT
        *,
        MAX(list_price) OVER (PARTITION BY category_name) AS max_price
    FROM products
    JOIN categories
        USING (category_id)
)
SELECT
    *
FROM t
WHERE
    list_price = max_price;

##6

SELECT 
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    store_name,
    COUNT(order_id) AS total_orders
FROM
    customers
        JOIN
    orders USING (customer_id)
        JOIN
    stores USING (store_id)
GROUP BY 
customer_id , 
full_name , 
store_name;

##7

SELECT 
    staff_id,
    CONCAT(first_name, ' ', last_name) AS staff_name
FROM
    staffs
        LEFT JOIN
    orders USING (staff_id)
WHERE order_id IS NULL;

##8
 
 SELECT 
    product_name, 
    SUM(quantity) AS total_quantity_sold
FROM
    products
        JOIN
    order_items USING (product_id)
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;

##9

WITH Priceranks AS (
    SELECT 
        list_price,
        ROW_NUMBER() OVER (ORDER BY list_price) AS rn,
        COUNT(*) OVER () AS total_count
    FROM products
)
SELECT AVG(list_price) AS median_price
FROM Priceranks
WHERE rn IN (
    FLOOR((total_count + 1) / 2),
    FLOOR((total_count + 2) / 2)
);

##10

SELECT 
    product_id,
    product_name
FROM
    products
WHERE
    NOT EXISTS( SELECT 
            product_id
        FROM
            order_items
        WHERE
            products.product_id = order_items.product_id);
            
##11

SELECT 
    staff_id,
    CONCAT(first_name, " ", last_name) AS staff_name,
    COUNT(order_id) AS total_sales
FROM staffs
JOIN orders USING (staff_id)
GROUP BY staff_id, staff_name
HAVING COUNT(order_id) > (
    SELECT AVG(sales_count) 
    FROM (
        SELECT COUNT(order_id) AS sales_count
        FROM orders
        GROUP BY staff_id
    ) AS staff_sales
);


##12

SELECT 
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    COUNT(product_id) AS total_products
FROM
    customers
        JOIN
    ORDERS USING (customer_id)
        JOIN
    order_items USING (order_id)
        JOIN
    products USING (product_id)
GROUP BY customer_id , full_name
HAVING COUNT(DISTINCT category_id) = (SELECT 
        COUNT(*)
    FROM
        categories);
    
    