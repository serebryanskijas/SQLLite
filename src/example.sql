select avg (count*price/100) from (select * from buy inner join product  p on p.id = buy.product_id);
select u.name, u.surname, b.date_stamp, p.name, p.price  from user as u, buy as b, product as p
where u.id = b.user_id and b.product_id = p.id and p.price <'1000' and u.name like 'А%';

select name, (price)/100 from product order by price desc limit 10;

select product.id, product.name, sum(buy.count) as count from product left join buy on product.id = buy.product_id
group by product.id order by count desc ;

select * from buy where product_id = '4259';

select sum(price*count/100) as viruchka from (select substr(date_stamp, 1,4) as year, buy.count, product.price from buy
    inner join product on buy.product_id = product.id where year = '2018');

select substr(b.date_stamp, 1,4) as year, sum(b.count*p.price/100) as sumprice, sum(b.count), u.name, u.surname from buy as b
 inner join product p on b.product_id = p.id inner join user u on b.user_id = u.id where year = '2018'
group by u.id order by sumprice desc limit 10;

select name, max(length(name)) from product union select name, min(length(name)) from product;

select u.id, u.name, u.surname, c.count from user u
INNER join (SELECT user_id, sum(length(comment)) AS count FROM comment GROUP BY user_id)
    c on u.id = c.user_id order by count desc limit 10;