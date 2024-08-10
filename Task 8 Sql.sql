select * from customer
select * from product

create view sales_customer_product_details as 
select p.product_id ,p.name, c.customer_id ,
sum(p.sales) as "sum_of_sales", sum(p.quantity) as "sum-of_quantity"
from customer as c
inner join product as p
on p.product_id=c.customer_id
group by p.product_id ,p.name, c.customer_id 
order by sum(sales)

select * from sales_customer_product_details
	
--insert

select * from product
insert into sales_customer_product_details(product_id,name,customer_id,sum_of_sales,sum_of_quanrity)
values(21,'Freeze',21,5000,30)
	
--update

update customer set name='Gitanjali' where customer_id=2
select * from customer
	
--alter

alter table customer add column age double precision
select * from customer

--delete

delete from customer where customer_id=11
select * from customer

--having subquey

select sum(sales),product_id,
(select customer_id from customer as c where c.customer_id=p.product_id)
from product as p group by product_id having sum(sales)>2500
