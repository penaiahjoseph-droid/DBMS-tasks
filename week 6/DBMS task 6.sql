use bill;

create table product (
    product_id int primary key,
    product_name varchar(100) not null,
    category_id int,
    price decimal(10,2) not null
);
insert into product values
(101, 'laptop', 1, 45000.00),
(102, 'mobile', 1, 18000.00),
(103, 'headphones', 2, 1500.00),
(104, 'keyboard', 2, 800.00),
(105, 'mouse', 2, 500.00),
(106, 'monitor', 3, 12000.00);
desc product;

select * from product;

create table review (
    review_id int auto_increment primary key,
    customer_id int not null,
    product_id int not null,
    rating int not null,
    review_text varchar(500) not null,
    review_date date not null,
    foreign key (customer_id)
        references customer(customer_id),
    foreign key (product_id)
        references product(product_id),
    check (rating between 1 and 5)
);
desc review;

show tables;
select * from review;
select
    c.customer_name,
    p.product_name,
    r.rating,
    r.review_text,
    r.review_date
from review r
join customer c on r.customer_id = c.customer_id
join product p on r.product_id = p.product_id;
select *
from review
where rating > 4;
select *
from review
order by review_date desc
limit 5;
select
    p.product_name,
    round(avg(r.rating), 2) as average_rating
from product p
left join review r on p.product_id = r.product_id
group by p.product_id, p.product_name;
select
    p.product_name,
    count(r.review_id) as total_reviews
from product p
left join review r on p.product_id = r.product_id
group by p.product_id, p.product_name;
select
    p.product_name,
    round(avg(r.rating), 2) as average_rating
from product p
join review r on p.product_id = r.product_id
group by p.product_id, p.product_name
having avg(r.rating) < 3;

select
    p.product_name,
    round(avg(r.rating), 2) as average_rating
from product p
join review r on p.product_id = r.product_id
group by p.product_id, p.product_name
order by average_rating desc;
select
    p.product_name,
    count(r.review_id) as total_reviews
from product p
left join review r on p.product_id = r.product_id
group by p.product_id, p.product_name
order by total_reviews desc;
select
    sum(case when rating = 5 then 1 else 0 end) as five_star,
    sum(case when rating = 4 then 1 else 0 end) as four_star,
    sum(case when rating between 1 and 2 then 1 else 0 end) as low_rated
from review;
select
    c.customer_name,
    count(r.review_id) as total_reviews,
    round(avg(r.rating), 2) as average_rating
from customer c
left join review r on c.customer_id = r.customer_id
group by c.customer_id, c.customer_name;
update review
set review_text = 'excellent quality'
where review_id = 1;
delete from review
where review_id = 5;
show create table review;

