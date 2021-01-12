select pro.pro_id,pro.pro_name,ord.date_of_purchase,COUNT(*) as total_sold
 from
 order_details ord
 JOIN
 customer cus ON ord.cust_id = cus.cust_id
 JOIN
 product pro ON pro.pro_id = ord.pro_id
 where
 cus.location_code ="l1"
 and ord.date_of_purchase between '2021-01-09' and '2021-01-12'
 GROUP BY pro.pro_id,ord.date_of_purchase;