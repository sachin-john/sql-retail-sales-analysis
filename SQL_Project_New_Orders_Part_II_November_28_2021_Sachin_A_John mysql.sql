-- 6. Write a query to display the customer_id,customer name, email and order details (order id, product desc,
-- product qty, subtotal(product_quantity * product_price)) for all customers even if they have not ordered any 
-- item.(225 ROWS) [NOTE: TABLE TO BE USED - online_customer, order_header, order_items, product]
SELECT a.CUSTOMER_ID, concat(a.CUSTOMER_FNAME,'',a.CUSTOMER_LNAME) AS NAME, a.CUSTOMER_EMAIL,
b.ORDER_ID, c.PRODUCT_DESC, d.PRODUCT_QUANTITY, (d.PRODUCT_QUANTITY*c.PRODUCT_PRICE) AS SUBTOTAL
FROM online_customer a
LEFT JOIN order_header b
ON a.CUSTOMER_ID = b.CUSTOMER_ID
LEFT JOIN order_items d
ON b.ORDER_ID = d.ORDER_ID
LEFT JOIN product c
ON d.PRODUCT_ID = c.PRODUCT_ID

-- 7. Write a query to display carton id, (len*width*height) as carton_vol and identify the optimum carton 
-- (carton with the least volume whose volume is greater than the total volume of all items (len * width * 
-- height * product_quantity)) for a given order whose order id is 10006, Assume all items of an order are 
-- packed into one single carton (box). (1 ROW) [NOTE: CARTON TABLE]
SELECT CARTON_ID, (LEN*WIDTH*HEIGHT) AS CARTON_VOL 
FROM (SELECT ORDER_ID 
 WHERE CARTON_VOL > sum(a.LEN*a.WIDTH*a.HEIGHT*b.PRODUCT_QUANTITY)
 AS OPTIMUM_CARTON
 FROM product a
 RIGHT JOIN order_items b
 ON a.PRODUCT_ID=b.PRODUCT_ID
  WHERE b.ORDER_ID = '10006'
  GROUP BY ORDER_ID)
FROM carton


-- 8. Write a query to display details (customer id,customer fullname,order id,product quantity) of customers 
-- who bought more than ten (i.e. total order qty) products per shipped order. (11 ROWS) [NOTE: TABLES TO BE USED 
-- - online_customer, order_header, order_items,]
SELECT a.CUSTOMER_ID, concat(a.CUSTOMER_FNAME,'',a.CUSTOMER_LNAME) AS CUSTOMER_FULLNAME,
b.ORDER_ID, sum(c.PRODUCT_QUANTITY) AS TOTAL_QUANTITY
FROM online_customer a
RIGHT JOIN order_header b
ON a.CUSTOMER_ID = b.CUSTOMER_ID
CROSS JOIN order_items c
ON b.ORDER_ID = c.ORDER_ID
WHERE b.ORDER_STATUS='Shipped'
GROUP BY ORDER_ID HAVING TOTAL_QUANTITY>10


-- 9. Write a query to display the order_id, customer id and customer full name of customers along with 
-- (product_quantity) as total quantity of products shipped for order ids > 10060. (6 ROWS) [NOTE: TABLES TO BE
-- USED - online_customer, order_header, order_items]
SELECT a.ORDER_ID, b.CUSTOMER_ID, concat(b.CUSTOMER_FNAME,'',b.CUSTOMER_LNAME) AS CUSTOMER_FULLNAME,
sum(c.PRODUCT_QUANTITY) AS TOTAL_QUANTITY
FROM order_header a
LEFT JOIN online_customer b
ON a.CUSTOMER_ID = b.CUSTOMER_ID 
LEFT JOIN order_items c
ON a.ORDER_ID=c.ORDER_ID 
WHERE a.ORDER_ID>10060 AND ORDER_STATUS = 'Shipped'
GROUP BY a.ORDER_ID


-- 10. Write a query to display product class description ,total quantity (sum(product_quantity),Total value 
-- (product_quantity * product price) and show which class of products have been shipped highest(Quantity) to 
-- countries outside India other than USA? Also show the total value of those items. (1 ROWS)[NOTE:PRODUCT TABLE,
-- ADDRESS TABLE,ONLINE_CUSTOMER TABLE,ORDER_HEADER TABLE,ORDER_ITEMS TABLE,PRODUCT_CLASS TABLE]
SELECT f.PRODUCT_CLASS_DESC,  sum(d.PRODUCT_QUANTITY) AS TOTAL_QUANTITY, 
(d.PRODUCT_QUANTITY * e.PRODUCT_PRICE) AS TOTAL_VALUE
FROM address a
LEFT JOIN online_customer b
ON a.ADDRESS_ID=b.ADDRESS_ID
RIGHT JOIN order_header c
ON b.CUSTOMER_ID=c.CUSTOMER_ID
CROSS JOIN order_items d
ON c.ORDER_ID=d.ORDER_ID
INNER JOIN product e
ON d.PRODUCT_ID=e.PRODUCT_ID
INNER JOIN product_class f
ON e.PRODUCT_CLASS_CODE=f.PRODUCT_CLASS_CODE
WHERE a.COUNTRY NOT IN ('USA','India') AND c.ORDER_STATUS = 'Shipped'
GROUP BY f.PRODUCT_CLASS_DESC
ORDER BY TOTAL_QUANTITY DESC
LIMIT 1







