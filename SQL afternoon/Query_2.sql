select
ord.salesexe_id,sal1.saleexe_name,sal1.dob,sal1.gender
,SUM(qty) as No_of_Products_Sold
from
order_details as ord
INNER JOIN
sales_exe as sal1
on ord.salesexe_id = sal1.salesexe_id
GROUP BY ord.salesexe_id
ORDER BY No_of_Products_Sold desc;n