# -- Creating database
create database zepto;
# -- Download and Generate the data
# -- Check the dataset
use zepto  #-- using the databse 
select * from zepto_v2;
#-- Creating the staging data to keep the orignal data safe
 create table zepto_staging like zepto_v2;


 #insert values into the staging table
insert zepto_staging select * from zepto_v2;

# -- Removing Duplicate values in staging table 

select *,row_number() over(partition by  category,mrp,discountpercent,availablequantity,discountedsellingprice,weightingms,outofstock ,quantity)as row_no from zepto_staging

with Duplicate_cte as
(
select *,row_number() over(partition by  category,`name`,mrp,discountpercent,availablequantity,discountedsellingprice,weightingms,outofstock ,quantity)as row_no from zepto_staging
)
select* from Duplicate_cte where row_no>1
select*from zepto_staging where mrp='7200'order by discountpercent,availablequantity,discountedsellingprice,weightingms,outofstock,quantity;
  
  
select COUNT(*) FROM zepto_staging;
with Duplicate_cte as
(
select *,row_number() over(partition by  category,`name`,mrp,discountpercent,availablequantity,discountedsellingprice,
weightingms,outofstock ,quantity)
as row_no from zepto_staging)



CREATE TABLE `zepto_staging3` (
  `Category` text,
  `name` text,
  `mrp` int DEFAULT NULL,
  `discountPercent` int DEFAULT NULL,
  `availableQuantity` int DEFAULT NULL,
  `discountedSellingPrice` int DEFAULT NULL,
  `weightInGms` int DEFAULT NULL,
  `outOfStock` text,
  `quantity` int DEFAULT NULL,
  `row_no` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into zepto_staging3
select *,row_number() over(partition by  category,`name`,mrp,discountpercent,availablequantity,discountedsellingprice,
weightingms,outofstock ,quantity)
as row_no from zepto_staging;

delete from zepto_staging3 where row_no>1
select COUNT(*) FROM zepto_staging3;
SELECT *FROM zepto_staging3
# -- Removing Duplicate values 
# step 1- Find the Duplicate values by using row_number() create new column to find how many duplicate values are there 
# step 2-To find duplicate values more than 1 we need to create temporary table which I create duplicate_cte(common table expression)
# step3- we need to recheck once 
# step4- create stagging table to add the row_no coloumn ,insert the values so that we can able to delete the coloumn ,if we delete just by using delete from zeptostagging where row_no>1 is not exist 
# mysql does not allow deleting directly from cte


# standardizing data
select distinct trim(category) from zepto_staging3;
select distinct category,trim(category)from zepto_staging3;
select distinct name,trim(name)from zepto_staging3;
select distinct mrp,trim(mrp)from zepto_staging3;
select distinct discountPercent,trim(discountPercent)from zepto_staging3;
select distinct availableQuantity,trim(availableQuantity)from zepto_staging3;
update zepto_staging3 set category=trim(category),name=trim(name),mrp=trim(mrp),discountPercent=trim(discountPercent),availableQuantity=trim(availableQuantity);

select*from zepto_staging3;

#-- Removing white space replace with null 

update zepto_staging3 set Category='null' where category like ' ';

update zepto_staging3 set `name`='null' where `name`=' ';

update zepto_staging3 set mrp ='null' where 'mrp'= ' ';

update zepto_staging3 set discountPercent='null' where 'discountPercent'=' ';

update zepto_staging3 set availableQuantity='null' where 'availableQuantity'=' ';

update zepto_staging3 set discountedSellingPrice ='null' where 'discountedSellingPrice' =' ';
update zepto_staging3 set weightInGms ='null' where 'weightInGms'=' ';
update zepto_staging3 set outOfStock ='null' where 'outOfStock' =' ';
update zepto_staging3 set quantity ='null' where 'quantity' =' ';

select * from zepto_staging3 
# Delete the coloum temp created to find the duplicate values
alter table zepto_staging3 drop column row_no;

# Removing Duplicate
# standardize the data
# null values or blank values
# Remove any columns







