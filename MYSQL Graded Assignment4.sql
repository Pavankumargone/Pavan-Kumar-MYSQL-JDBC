create database  Ecommerce;
use  Ecommerce;
drop database Ecommerce;


create table supplier(
SUPP_ID INT primary key,
SUPP_NAME varchar(50) NOT NULL,

SUPP_CITY varchar(50) NOT NULL,

SUPP_PHONE varchar(50) NOT NULL);



create table customer(CUS_ID INT primary key,
CUS_NAME VARCHAR(20) NOT NULL,

CUS_PHONE VARCHAR(10) NOT NULL,

CUS_CITY VARCHAR(30) NOT NULL,

CUS_GENDER CHAR );


create table category(CAT_ID INT primary key,
CAT_NAME VARCHAR(20) NOT NULL);



create table product(PRO_ID INT primary key,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT , 
FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID));



create table supplier_pricing(PRICING_ID INT Primary key,
PRO_ID INT ,
foreign key (pro_id) references product(pro_id),
SUPP_ID INT ,
foreign key (SUPP_ID) references supplier(SUPP_ID),
SUPP_PRICE INT DEFAULT 0);


CREATE TABLE orders (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    PRICING_ID INT,
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

create table rating(RAT_ID INT Primary key,
ORD_ID INT ,
 FOREIGN KEY (ORD_ID) REFERENCES orders(ORD_ID),
RAT_RATSTARS INT NOT NULL );


insert into supplier (SUPP_ID ,SUPP_NAME ,SUPP_CITY ,SUPP_PHONE)values(1, 'Rajesh Retails' ,'Delhi',1234567890),
(2 ,'Appario Ltd', 'Mumbai', 2589631470),
(3 ,'Knome products', 'Banglore' ,9785462315),
(4 ,'Bansal Retails', 'Kochi' ,8975463285),
(5 ,'Mittal Ltd', 'Lucknow', 7898456532);


insert into customer(CUS_ID ,CUS_NAME, CUS_PHONE, CUS_CITY ,CUS_GENDER)values(1, 'AAKASH' ,9999999999, 'DELHI', 'M'),
(2 ,'AMAN' ,9785463215, 'NOIDA', 'M'),
(3, 'NEHA', 9999999999, 'MUMBAI', 'F'),
(4 ,'MEGHA',9994562399, 'KOLKATA' ,'F'),
(5 ,'PULKIT', 7895999999, 'LUCKNOW', 'M');

insert into category(CAT_ID ,CAT_NAME)values(1 ,'BOOKS'),
(2 ,'GAMES'),
(3 ,'GROCERIES'),
(4 ,'ELECTRONICS'),
(5,' CLOTHES');




INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned Milk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and colors', 5),
(9, 'Project IGI', 'compatible with Windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);


insert into supplier_pricing(PRICING_ID, PRO_ID, SUPP_ID ,SUPP_PRICE) values(1, 1 ,2 ,1500),
(2 ,3 ,5 ,30000),
(3 ,5 ,1 ,3000),
(4 ,2 ,3 ,2500),
(5 ,4 ,1 ,1000),
(6 ,12 ,2 ,780),
(7 ,12 ,4 ,789),
(8 ,3 ,1 ,31000),
(9 ,1 ,5 ,1450),
(10 ,4 ,2 ,999),
(11 ,7 ,3 ,549),
(12 ,7 ,4 ,529),
(13 ,6 ,2 ,105),
(14 ,6 ,1 ,99),
(15 ,2 ,5 ,2999),
(16 ,5 ,2 ,2999);
INSERT INTO Orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
VALUES
(101, 1500, '2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107, 789, '2021-09-01', 3, 7),
(108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-01-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3),
(116, 99, '2021-09-17', 2, 14);


INSERT INTO Rating (RAT_ID, ORD_ID, RAT_RATSTARS)
VALUES
    (1, 101, 4),
    (2, 102, 3),
    (3, 103, 1),
    (4, 104, 2),
    (5, 105, 4),
    (6, 106, 3),
    (7, 107, 4),
    (8, 108, 4),
    (9, 109, 3),
    (10, 110, 5),
    (11, 111, 3),
    (12, 112, 4),
    (13, 113, 2),
    (14, 114, 1),
    (15, 115, 1),
    (16, 116, 0);

show tables;
-- 3) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000
select count(distinct c.cus_id) as total_customers,c.cus_gender
from customer c
join orders o
on c.cus_id = o.cus_id
where o.ord_amount >=3000
group by c.cus_gender;
-- Question 4
select P.pro_name 
from product as P 
join (select ord.ord_id, S.pricing_id,S.pro_id 
from supplier_pricing as S
join (select C.cus_id,O.ord_id,O.pricing_id
from orders as O 
join (select cus_id from customer where cus_id =2)as C
on C.cus_id = O.cus_id)as ord
on S.pricing_id = ord.pricing_id) as sup
on sup.pro_id = P.pro_id;

-- Question 5.
select s.supp_id, s.supp_name, COUNT(p.supp_id) as product_count
from Supplier s
join supplier_pricing p on s.supp_id = p.supp_id
group by s.supp_id
having count(p.supp_id) > 1;

-- Question 6.
create view lowest_expensive_product as 
select tab1.cat_id,tab1.cat_name,tab1.pro_name,min(s.supp_price) as min_price
from supplier_pricing s join 
(select c.cat_id,c.cat_name,p.pro_name,p.pro_id
from category c
join product p
on c.cat_id = p.cat_id) as tab1
on s.pro_id = tab1.pro_id
group by tab1.cat_id;

--  Question 7.
select P.pro_id, P.pro_name 
from product as P
join(select S.pricing_id,S.pro_id 
from supplier_pricing as S 
join (select ord_id, pricing_id 
from orders 
where ord_date > '2021-10-05') as ord
on S.pricing_id = ord.pricing_id) as pri
on P.pro_id = pri.pro_id;

-- Question 8.
select cus_name, cus_gender
from customer
where cus_name like '%a'or cus_name like 'a%';

-- 9



