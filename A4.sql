drop schema if exists airsupply;
create schema if not exists airsupply;
use airsupply;

drop table if exists Vendor;
CREATE TABLE Vendor (
Vendor_id int(4) primary key,
Vendor_name varchar(32),
APT int(2)
)engine=innodb;

insert into vendor values
('1001','Hulkey Fasteners','30'),
('1002','Spacetime Technologies','25'),
('1003','Durrable Products','45'),
('1004','Fast-Tie Aerospace','30'),
('1005','Alum Sheeting','30'),
('1006','Steelpin Inc.','30'),
('1007','Manley Valve','30'),
('1008','Pylon Accessories','15');

drop table if exists Product;
CREATE TABLE Product (
Product_id int(4) primary key,
Vendor_id int(4),
Product_name varchar(24),
Product_description varchar(64),
Sale_price float(8),
foreign key (Vendor_id) references Vendor(Vendor_id)
)engine=innodb;

insert into product values
(1122,1001,'Airframe fasteners','Airframe fasteners by Hulkey Fasteners','4.25'),
(5066,1001,'Shielded Cable/ft.','Shielded Cable/ft. by Hulkey Fasteners','0.95'),
(3166,1001,'Electrical Connector','Electrical Connector by Hulkey Fasteners','1.25'),
(1243,1005,'Airframe fasteners','Airframe fasteners by Alum Sheeting','4.25'),
(4224,1005,'Bolt-nut package','Bolt-nut package by Alum Sheeting','3.95'),
(5417,1005,'Control Panel','Control Panel by Alum Sheeting','255'),
(5462,1004,'Shielded Cable/ft.','Shielded Cable/ft. by Fast-Tie Aerospace','1.05'),
(6321,1004,'O-Ring','O-Ring by Fast-Tie Aerospace','2.45'),
(5319,1006,'Shielded Cable/ft.','Shielded Cable/ft. by Steelpin Inc.','1.1'),
(4312,1006,'Bolt-nut package','Bolt-nut package by Steelpin Inc.','3.75'),
(9966,1001,'Hatch Decal','Hatch Decal by Hulkey Fasteners','0.75'),
(5234,1006,'Electrical Connector','Electrical Connector by Steelpin Inc.','1.65'),
(5166,1004,'Electrical Connector','Electrical Connector by Fast-Tie Aerospace','1.25'),
(7260,1003,'Pressure Gauge','Pressure Gauge by Durrable Products','90'),
(1369,1003,'Airframe fasteners','Airframe fasteners by Durrable Products','4.2'),
(9399,1003,'Gasket','Gasket by Durrable Products','3.65'),
(8008,1006,'Machined Valve','Machined Valve by Steelpin Inc.','645'),
(4111,1002,'Bolt-nut package','Bolt-nut package by Spacetime Technologies','3.55'),
(9752,1002,'Gasket','Gasket by Spacetime Technologies','4.05'),
(7258,1007,'Pressure Gauge','Pressure Gauge by Manley Valve','100.5'),
(6489,1002,'O-Ring','O-Ring by Spacetime Technologies','3'),
(9764,1008,'Gasket','Gasket by Pylon Accessories','3.75'),
(6433,1008,'O-Ring','O-Ring by Pylon Accessories','2.95'),
(6431,1007,'O-Ring','O-Ring by Manley Valve','2.85'),
(5125,1002,'Shielded Cable/ft.','Shielded Cable/ft. by Spacetime Technologies','1.15'),
(4569,1003,'Bolt-nut package','Bolt-nut package by Durrable Products','3.5'),
(8148,1007,'Machined Valve','Machined Valve by Manley Valve','655.5'),
(5454,1003,'Control Panel','Control Panel by Durrable Products','220'),
(5634,1005,'Side Panel','Side Panel by Alum Sheeting','185'),
(5275,1003,'Shielded Cable/ft.','Shielded Cable/ft. by Durrable Products','1'),
(5689,1004,'Side Panel','Side Panel by Fast-Tie Aerospace','175'),
(5677,1006,'Side Panel','Side Panel by Steelpin Inc.','195'),
(7268,1004,'Pressure Gauge','Pressure Gauge by Fast-Tie Aerospace','95'),
(9955,1007,'Door Decal','Door Decal by Manley Valve','0.55'),
(9977,1007,'Panel Decal','Panel Decal by Manley Valve','1'),
(9967,1007,'Hatch Decal','Hatch Decal by Manley Valve','0.85');



drop table if exists Orders;
CREATE TABLE Orders (
Order_id int(5),
Line_Number int(1),
Product_id int(4),
Order_Quantity int(10),
Order_Date date,
Est_arrival_time date,
foreign key (Product_id) references Product(Product_id),
primary key (Order_id, Line_Number)
)engine=innodb;

insert into Orders values
(10001,'1','1122','19500.00','2018-6-21','2018-7-11'),
(10001,2,5066,"14500.00",'2018-6-21','2018-7-11'),
(10001,3,3166,"4000.00",'2018-6-21','2018-7-11'),
(10002,1,1243,"10000.00",'2018-6-24','2018-7-12'),
(10002,2,4224,"5000.00",'2018-6-24','2018-7-12'),
(10002,3,5417,406,'2018-6-24','2018-7-12'),
(10003,1,5462,"23000.00",'2018-6-26','2018-7-13'),
(10003,2,6321,"1300.00",'2018-6-26','2018-7-13'),
(10004,1,5462,"21500.00",'2018-7-1','2018-7-20'),
(10005,1,5319,"17500.00",'2018-7-6','2018-7-29'),
(10005,2,4312,"4250.00",'2018-7-6','2018-7-29'),
(10006,1,5462,"22500.00",'2018-7-6','2018-7-24'),
(10006,2,6321,"1200.00",'2018-7-6','2018-7-24'),
(10007,1,3166,"5100.00",'2018-7-11','2018-7-27'),
(10007,2,9966,500,'2018-7-11','2018-7-27'),
(10008,1,4312,"3750.00",'2018-7-11','2018-7-30'),
(10008,2,5319,"18100.00",'2018-7-11','2018-7-30'),
(10008,3,5234,"4200.00",'2018-7-11','2018-7-30'),
(10009,1,5462,"21000.00",'2018-7-11','2018-7-31'),
(10009,2,5166,"3800.00",'2018-7-11','2018-7-31'),
(10009,3,6321,"2500.00",'2018-7-11','2018-7-31'),
(10010,1,7260,100,'2018-7-11','2018-7-26'),
(10010,2,1369,"13500.00",'2018-7-11','2018-7-26'),
(10010,3,9399,"1250.00",'2018-7-11','2018-7-26'),
(10011,1,3166,"5500.00",'2018-07-18','2018-8-4'),
(10012,1,4312,"4200.00",'2018-7-18','2018-8-8'),
(10012,2,5234,"4850.00",'2018-7-18','2018-8-8'),
(10013,1,4312,"4150.00",'2018-7-20','2018-8-9'),
(10013,2,5234,"4750.00",'2018-7-20','2018-8-9'),
(10013,3,5319,"16500.00",'2018-7-20','2018-8-9'),
(10013,4,8008,100,'2018-7-20','2018-8-9'),
(10014,1,1122,"15500.00",'2018-7-21','2018-8-10'),
(10015,1,1122,"12500.00",'2018-7-22','2018-8-9'),
(10015,2,3166,"5200.00",'2018-7-22','2018-8-9'),
(10015,3,5066,"2400.00",'2018-7-22','2018-8-9'),
(10016,1,1243,"9000.00",'2018-7-22','2018-8-10'),
(10017,1,4111,"4800.00",'2018-7-22','2018-8-18'),
(10017,2,9752,"1500.00",'2018-7-22','2018-8-18'),
(10018,1,7258,120,'2018-7-22','2018-8-7'),
(10019,1,1122,"15000.00",'2018-7-25','2018-8-13'),
(10020,1,3166,"5000.00",'2018-7-27','2018-8-15'),
(10020,2,5066,"17500.00",'2018-7-27','2018-8-15'),
(10021,1,4111,"4585.00",'2018-7-27','2018-8-28'),
(10021,2,9752,"1300.00",'2018-7-27','2018-8-28'),
(10022,1,4111,"4200.00",'2018-8-1','2018-9-12'),
(10022,2,9752,"1275.00",'2018-8-1','2018-9-12'),
(10022,3,6489,"1100.00",'2018-8-1','2018-9-12'),
(10023,1,4111,"4250.00",'2018-8-6','2018-9-7'),
(10024,1,9752,"1450.00",'2018-8-6','2018-8-23'),
(10024,2,6489,"1050.00",'2018-8-6','2018-8-23'),
(10025,1,9764,"1980.00",'2018-8-6','2018-8-27'),
(10025,2,6433,"1250.00",'2018-8-6','2018-8-27'),
(10026,1,9764,"1750.00",'2018-8-9','2018-8-26'),
(10027,1,4111,"4150.00",'2018-8-11','2018-9-22'),
(10027,2,9752,"1550.00",'2018-8-11','2018-9-22'),
(10027,3,6489,900,'2018-8-11','2018-9-22'),
(10028,1,6431,"1300.00",'2018-8-11','2018-8-29'),
(10028,2,7258,90,'2018-8-11','2018-8-29'),
(10029,1,9764,"1850.00",'2018-8-11','2018-9-2'),
(10030,1,1369,"14000.00",'2018-8-13','2018-8-31'),
(10031,1,1122,"14500.00",'2018-8-14','2018-8-31'),
(10031,2,5066,"1550.00",'2018-8-14','2018-8-31'),
(10032,1,9764,"1800.00",'2018-8-14','2018-9-2'),
(10032,2,6433,"1500.00",'2018-8-14','2018-9-2'),
(10033,1,1369,"10000.00",'2018-8-15','2018-9-1'),
(10034,1,1122,"18000.00",'2018-8-17','2018-9-5'),
(10035,1,5125,"15000.00",'2018-8-17','2018-9-12'),
(10035,2,4111,"4600.00",'2018-8-17','2018-9-12'),
(10035,3,6489,"1100.00",'2018-8-17','2018-9-12'),
(10036,1,6431,"1350.00",'2018-8-17','2018-9-4'),
(10037,1,9399,"1250.00",'2018-8-17','2018-9-3'),
(10038,1,9399,"1450.00",'2018-8-19','2018-9-5'),
(10038,2,4569,"3900.00",'2018-8-19','2018-9-5'),
(10039,1,6431,"1250.00",'2018-8-21','2018-9-7'),
(10039,2,7258,90,'2018-8-21','2018-9-7'),
(10039,3,8148,125,'2018-8-21','2018-9-7'),
(10040,1,9399,"1985.00",'2018-8-21','2018-9-8'),
(10040,2,5454,550,'2018-8-21','2018-9-8'),
(10041,1,9399,"1470.00",'2018-8-23','2018-9-9'),
(10041,2,5454,350,'2018-8-23','2018-9-9'),
(10042,1,1243,"10500.00",'2018-8-26','2018-9-14'),
(10043,1,4224,"4500.00",'2018-8-26','2018-9-14'),
(10044,1,1122,"17000.00",'2018-8-27','2018-9-16'),
(10044,2,3166,"5425.00",'2018-8-27','2018-9-16'),
(10045,1,6321,"1250.00",'2018-8-28','2018-9-18'),
(10046,1,8008,150,'2018-8-31','2018-9-23'),
(10047,1,5417,550,'2018-9-5','2018-9-24'),
(10047,2,5634,150,'2018-9-5','2018-9-24'),
(10048,1,1122,"17500.00",'2018-9-10','2018-10-1'),
(10049,1,5275,"25000.00",'2018-9-10','2018-9-27'),
(10050,1,5689,155,'2018-9-10','2018-10-1'),
(10051,1,6321,"1500.00",'2018-9-10','2018-9-30'),
(10052,1,5677,130,'2018-9-13','2018-10-5'),
(10053,1,8008,120,'2018-9-13','2018-10-2'),
(10053,2,5677,120,'2018-9-13','2018-10-2'),
(10054,1,5634,140,'2018-9-14','2018-10-2'),
(10055,1,6489,"1050.00",'2018-9-14','2018-10-8'),
(10056,1,5689,150,'2018-9-17','2018-10-7'),
(10056,2,5462,"20750.00",'2018-9-17','2018-10-7'),
(10056,3,7268,110,'2018-9-17','2018-10-7'),
(10057,1,9955,150,'2018-9-17','2018-10-4'),
(10057,2,7258,100,'2018-9-17','2018-10-4'),
(10058,1,9955,200,'2018-9-21','2018-10-9'),
(10058,2,9977,525,'2018-9-21','2018-10-9'),
(10058,3,7258,95,'2018-9-21','2018-10-9'),
(10059,1,5677,110,'2018-9-21','2018-10-15'),
(10060,1,5689,175,'2018-9-21','2018-10-13'),
(10060,2,7268,105,'2018-9-21','2018-10-13'),
(10061,1,9955,125,'2018-9-24','2018-10-11'),
(10061,2,9977,525,'2018-9-24','2018-10-11'),
(10061,3,9967,550,'2018-9-24','2018-10-11');


delimiter $$
create function query_runner() returns varchar(40)
deterministic
begin
return CONCAT("Queried by Shayn on ", now());
end $$

delimiter ;

create view vw_vendor_products as 
select v.vendor_id,v.vendor_name, p.product_name,p.sale_price,p.product_description,
query_runner() as "Queryer/Date"
from vendor v, product p
where v.vendor_id = p.vendor_id
order by vendor_name, product_name;

#select * from vw_vendor_products;

create view vw_vendor_product_counts as 
SELECT vendor.vendor_id as "Vendor Id",vendor.vendor_name as "Vendor Name",
COUNT(distinct product_id) as count, query_runner() as "Queryer / Date" FROM product, vendor
where vendor.vendor_id = product.vendor_id 
group by product.vendor_id
order by count desc, vendor_name asc;

#select * from vw_vendor_product_counts

create view vw_vendor_totals as
select vendor.vendor_id as "Vendor ID", vendor.vendor_name as "Vendor Name", 
count(orders.order_id), sum(orders.order_quantity) as "Total Orders",
 round(sum(orders.order_quantity*product.sale_price),2) as "Total Cost",
 query_runner() as "Queryer / Date" from orders
join product on orders.product_id = product.product_id
join vendor on product.vendor_id = vendor.vendor_id
group by vendor.vendor_name order by 5 desc;

#select * from vw_vendor_totals;

create view vw_payments as
select orders.order_id as "Orders ID", vendor.vendor_name as "Vendor Name",
orders.order_date,date_add(orders.order_date,INTERVAL vendor.apt DAY) as "Payment Date",
query_runner() as "Queryer / Date" from orders
join product on orders.product_id = product.product_id join vendor on product.vendor_id = vendor.vendor_id
group by orders.order_id order by 4 asc;
#select * from vw_payments

create view vw_vendor_shipping_stats as
select vendor.vendor_id as "Vendor ID", vendor.vendor_name as "Vendor Name",
round(avg(datediff(orders.est_arrival_time, orders.order_date ))) as "Avg. Ship Date",
query_runner() as "Queryer / Date" from orders
join product on orders.product_id = product.product_id 
join vendor on product.vendor_id = vendor.vendor_id
group by vendor.vendor_name order by 3 asc;

#select * from vw_vendor_shipping_stats;

create view vw_all_orders as select orders.order_id as "Order ID", orders.line_number "Line Number",
vendor.vendor_id as "Vendor ID", vendor.vendor_name as "Vendor Name", product.product_id as "Prodct ID",product.product_name as "Product Name",
product_description as "Product Description", sale_price as "Sale Price", order_quantity as "Order Quantity", 
round(order_quantity * sale_price,2) as "Order Cost",
 apt as "Account payable term", order_date as "Order Date", est_arrival_time as "ETA" , query_runner() as "Queryer / Date" 
from product, orders, vendor where orders.product_id = product.product_id and product.vendor_id = vendor.vendor_id
group by orders.order_id, line_number order by order_id asc;

#select * from vw_all_orders

drop procedure if exists sp_vendor_products;
DELIMITER $$
create procedure sp_vendor_products(IN vendor_input int(4))
begin
select product.vendor_id, vendor.vendor_name, product_id, product_name, sale_price, query_runner()
from vendor, product where product.vendor_id like concat("%",vendor_input,"%") 
and vendor.vendor_id = product.vendor_id
group by product_id order by sale_price asc;
end $$
#call sp_vendor_products(1002);

drop procedure if exists sp_find_products;
DELIMITER $$
create procedure sp_find_products(IN product_input varchar(15))
begin
select product_id as "Product ID", product_name as "Product Name", sale_price as "Sale Price", 
vendor.vendor_id as "Vendor ID", vendor.vendor_name as "Vendor Name",query_runner() as "Queryer/ Date"
from vendor, product where product.product_name like concat("%",product_input,"%") 
and vendor.vendor_id = product.vendor_id
group by product_id order by sale_price asc;
end $$

#call sp_find_products("nut");

drop procedure if exists sp_show_orders_by_date;
DELIMITER $$
create procedure sp_show_orders_by_date(IN date_input varchar(15), end_input varchar(15))
begin
select order_id as "Order ID", line_number as "Line Number", vendor.vendor_id as "Vendor ID", vendor.vendor_name as "Vendor Name",
orders.product_id as "Product ID", product_name as "Product Name", sale_price as "Sale Price", order_date as "Order Date",
est_arrival_time as "Arrival Date", query_runner() as "Queryer/ Date"
from vendor, product, orders where STR_TO_DATE(date_input, '%Y%m%d')<= order_date  and  order_date <= STR_TO_DATE(end_input, '%Y%m%d') 
and orders.product_id = product.product_id and product.vendor_id = vendor.vendor_id
group by order_id,line_number order by order_date desc;
end $$
#call sp_show_orders_by_date('20180801','20180909');



drop procedure if exists sp_best_pricing_by_product;
DELIMITER $$
create procedure sp_best_pricing_by_product(IN product_input varchar(15))
begin
select product.product_id as "Product ID", product_name as "Product Name", round(min(sale_price),2) as "Sale Price",
product.vendor_id as "Vendor ID", vendor.vendor_name as "Vendor Name", query_runner() as "Queryer/ Date"
from vendor, product where product_name like concat("%",product_input,"%") 
and product.vendor_id = vendor.vendor_id order by vendor_name;
end $$

#call sp_best_pricing_by_product("O-Ring");

create view extracredit as select orders.order_id as "Order ID", orders.line_number "Line Number",
vendor.vendor_id as "Vendor ID", vendor.vendor_name as "Vendor Name", product.product_id as "Prodct ID",product.product_name as "Product Name",
product_description as "Product Description", sale_price as "Sale Price", order_quantity as "Order Quantity", round(order_quantity * sale_price,2) as "Order Cost", 
round(((round(order_quantity * sale_price,2)*(1+(0.0243*(apt/90.0)))) - round(order_quantity * sale_price,2)),2) as "Amount Saved",
 apt as "Account payable term", order_date as "Order Date", est_arrival_time as "ETA" , query_runner() as "Queryer / Date" 
from product, orders, vendor where orders.product_id = product.product_id and product.vendor_id = vendor.vendor_id
group by orders.order_id, line_number order by order_id asc;
select * from extracredit;

insert into Orders (10122,'3','1122','19500.00','2018-6-21','2018-7-11');