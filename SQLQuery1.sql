--create database SQL_Assignment1;
--Task1
create table weather2(
id int not null primary key identity(1,1),
recordDate date,
temperature int
);
Select * from weather2
--Task2
create table weather_details2(
Desc_id int not null primary key identity(1,1),
tempID int foreign key references weather2(id),
Description varchar(255)
);
Select * from weather_details2
--Task3
exec sp_rename 'weather_details2.tempID','temperatureID','column'
select * from weather_details2
--Task4
insert into weather2(recordDate,temperature)
values
('2022-11-09','35'),
('2022-11-05','32'),
('2022-11-08','33'),
('2022-11-07','36'),
('2022-11-06','34'),
	('2021-12-07','10'),
	('2021-11-06','31'),
	('2023-01-07','5'),
	('2022-11-20','36'),
	('2022-12-07','36');
select * from weather2
insert into weather_details2(temperatureID,Description)
values
('1','Relevantly Hotter'),
('2','Less Hot'),
('3','Slim Hot'),
('4','Mild Hot'),
('5','Average Hot'),
('6','Windy'),
('7','Fair'),
('8','Stormy'),
('9','Average Hot'),
('10','Average Hot');
select * from weather_details2
--Task5
SELECT recordDate FROM weather2
WHERE temperature>35 AND year(recordDate)='2022';

--update weather2 set temperature=31 where id=7
select * from weather2
--Task6
SELECT weather2.recordDate, weather2.temperature, weather_details2.Description
FROM weather2
INNER JOIN weather_details2
ON weather2.id=weather_details2.temperatureID
Where year(recordDate)='2021';
--Task7
UPDATE weather2 SET temperature=(temperature*9/5)+32;
select * from weather2
--Task8
update weather_details2 set Description='stormy' where Description='windy';
select * from weather_details2
--Task9
DELETE weather_details2
FROM weather2
INNER JOIN weather_details2 ON weather2.id = weather_details2.temperatureID
where weather2.recordDate>Getdate();
select * from weather_details2
delete from weather2 WHERE recordDate>cast(getdate() as date);
select * from weather2
--Task10
ALTER TABLE weather_details2
DROP CONSTRAINT FK__weather_d__tempI__2C538F61; --sp_help 'weather_details2';
delete from weather2
select * from weather2
--Task11
truncate table weather_details2
select * from weather_details2
--Task12
drop table weather
drop table weather_details