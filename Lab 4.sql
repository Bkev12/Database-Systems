--- Kevin Bruce 
--- 2/12/14
--- Lab 4

select city
from agents 
where aid in (select aid 
	       from orders 
	       where cid in (select cid 
			     from customers 
			     where name= 'Basics')
			     );

select pid 
from orders 
where aid in (select aid 
	       from orders
	       where cid in (select cid 
			    from customers 
		            where city = 'Kyoto' )
				        );
				        
select cid, name 
from customers 
where cid in (select cid 
		from orders 
		where aid in (select aid 
				from agents 
				where aid != 'a03')
				);

select cid, name 
from customers 
where cid in (select cid 
		from orders 
		where pid = 'p01'
		and cid in (select cid 
			     from orders 
			     where pid = 'p07')
			     );


select pid 
from orders 
where cid in (select cid 
	       from orders
	       where aid = 'a03');	


select name, discount 
from customers 
where cid in (select cid  
	     from orders 
	     where aid in (select aid 
			    from agents 
			    where city = 'Duluth'
			    or city = 'Dallas')
			    );

select *
from customers 
where discount in (select discount 
		from customers
		where city = 'Dallas'
		or city = 'Kyoto');
