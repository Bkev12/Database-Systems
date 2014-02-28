-------------Kevin Bruce-----------
--------------2/28/2014-------------
-----Worked with Cornor Kincart-----

1.
select c.name, c.city 
from customers c
left outer join products 
on c.cid = p.pid
where c.city in (select  city
	from products p
	group by city
	order by sum(quantity) desc
	limit 1)
	

2.
select c.name, c.city 
from customers c,
orders o
right outer join products 
on o.cid = products.pid
where c.city in (select  city
	from products p
	group by city
	order by sum(quantity) desc
	limit 1)
	

3.
select p.name 
from products p
where p.priceUSD > (select avg(priceUSD)
			from products);


4.
select c.name, o.pid, o.dollars
from customers c,
	orders o
where o.cid = c.cid
order by o.dollars desc


5.
select c.name, coalesce (sum(o.dollars), 0)
from customers c
left outer join orders 
	on c.cid = orders.cid
	group by c.cid
order by c.name asc


6.
select c.name, a.name, p.name
from customers c,
     agents a,
     products p,
     orders o
where c.cid = o.cid
	and a.aid = o.aid
	and p.pid = o.pid
	and a.city = 'New York'


7.
select o.dollars,CAST((o.qty * p.priceUSD) - (o.qty * p.priceUSD *(c.discount/100.00)) 
as numeric(12,2))
as PriceCheck
	from orders o, 
	products p, 
	customers c
where o.pid = p.pid 
	and c.cid = o.cid