--Kevin Bruce ----
---2/21/2014----
-----lab 5---

select agents.city
from customers,
	agents,
	orders
	where agents.aid=orders.aid
	and orders.cid=customers.cid 
	and customers.name='Basics';
	

select orders.pid 
from customers,
	orders
	where orders.cid=customers.cid
	and customers.city='Kyoto';


select name 
from customers 
where cid not in (select customers.cid 
		from orders
		join customers on
		 customers.cid = orders.cid);

select name 
from customers
left outer join orders
on customers.cid = orders.cid
where orders.cid is null


select customers.name
from customers, 
	orders,
	agents
	where agents.aid=orders.aid
	and orders.cid=customers.cid;


select customers.name, customers.city
from customers, 
	orders,
	agents
	where agents.aid=orders.aid
	and orders.cid=customers.cid;


select name, city 
from customers
where city in (select products.city
		from products
		order by products.quantity
		limit 1);


	
