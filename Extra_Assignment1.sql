create database Fresher_Training_Management;
use Fresher_Training_Management
create table Trainee(
traineeID int not null primary key auto_increment,
fullname varchar(50) not null, 
birth_date date not null,
gender enum('female', 'male', 'unknown' ), 
ET_IQ tinyint unsigned not null, 
ET_Gmath tinyint unsigned not null,
ET_English tinyint unsigned not null,
training_class char(10) not null, 
evaluation_notes varchar(50)
);
-- alter table trainee  auto_increment=1;
alter table trainee modify column VTI_Account char(20)
alter table trainee drop constraint CK_English
alter table Trainee add constraint CK_IQ check(ET_IQ <= 20)
alter table Trainee add constraint CK_Gmath CHECK(ET_Gmath <= 20)
alter table Trainee add constraint CK_English CHECK(ET_English <= 50)
alter table Trainee add VTI_Account char(5) not null unique;
================================
create table table2(
ID int not null primary key auto_increment,
name varchar(30) not null,
code char(5) not null,
modifieddate date not null
);
create table table3(
ID int not null primary key auto_increment, 
name varchar(30) not null,
birthdate date not null, 
gender enum('0', '1', 'null'),
isDeletedFlags enum('0', '1')
)
// Q1: insert 10 records
insert into  trainee (fullname, birth_date, gender, ET_IQ, ET_Gmath, ET_English, training_class, evaluation_notes, VTI_Account)
values
('Nguyễn Kim Long', '2002-04-12', 'male', 2, 5, 10, 'Rocket30', 'null', 'kimlong@vti.com')
('Nguyễn Trà My', '2004-12-12', 'female', 7, 3, 20, 'Rocket31', '', 'tramy@vti.com'),
('Lê Ngọc An', '2003-10-12', 'male', 5, 9, 18, 'Rocket32', '', 'ngocan@vti.com'),
('Đỗ Ngọc Diệp', '2000-11-10', 'female', 10, 9, 30, 'Rocket32', '', 'diepdo@vti.com'),
('Vũ Văn Tuấn', '1999-09-30', 'male', 7, 3, 20, 'Rocket31', '', 'tuanvu@vti.com'),
('Trần Tuấn Anh', '2000-01-12', 'male', 19, 7, 21, 'Rocket33', '', 'tuananh@vti.com'),
('Lê Nghĩa Dũng', '2004-12-20', 'male', 2, 9, 40, 'Rocket34', '', 'dung@vti.com'),
('Nguyễn Minh Tuấn', '1998-05-09', 'male', 8, 9, 25, 'Rocket35', '', 'minhtuan@vti.com'),
('Lê Mạnh Hưng', '2001-06-19', 'male', 11, 10, 29, 'Rocket36', '', 'manhhung@vti.com'),
('Nguyễn Mai Linh', '2003-07-08', 'female', 12, 13, 14, 'Rocket37', '', 'mailinh@vti.com'), 
 ('Nguyễn Tra Linh', '2003-07-08', 'female', 12, 13, 14, 'Rocket37', '', 'tralinh@vti.com')
;
select *from trainee where traineeID =8
update trainee set fullname = 'nguyen minh quan' where traineeID =11
delete *from trainee  where traineeID =11
-- Q2: Query all the trainees who is passed the entry test, group them into different birth months
group trainee follow birth month
select  MONTH (birth_date), count(traineeID)  from trainee group by month (birth_date)  order by MONTH (birth_date)  asc  
-- Q3: Query the trainee who has the longest name, showing his/her age along with his/her basic information (as defined in the table)
select traineeID,  from trainee order by char_length (fullname) desc 
select traineeID, (year(curdate())-year(birth_date))-(right(curdate(), 5)< right(birth_date, 5)) as age, 
gender, ET_IQ , ET_Gmath , ET_English, training_class, VTI_Account from trainee
where  char_length  (fullname) = (select  char_length  (fullname) as dodai from trainee order by dodai desc limit 1)
-- Q4: Query all the ET-passed trainees. One trainee is considered as ET-passed
-- when he/she has the entry test points satisfied below criteria:
-- ET_IQ + ET_Gmath>=20
select *from trainee where ET_IQ + ET_Gmath >=20
-- ET_IQ>=8
select *from trainee where ET_IQ >= 8
-- ET_Gmath>=8
select *from trainee where ET_Gmath  >= 8
-- ET_English>=18
select *from trainee where ET_English  >= 18
-- Q5: delete information of trainee who has TraineeID = 3
delete from trainee where traineeID = 3
-- Q6: trainee who has TraineeID = 5 move "2" class. Let update information into database
update trainee set training_class = 'Rocket32' where traineeID = 5