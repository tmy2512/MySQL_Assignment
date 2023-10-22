create database Fresher_Training_Management;
use Fresher_Training_Management
create table Trainee(
traineeID int not null primary key auto_increment,
fullname varchar(50) not null, 
birth_date date not null,
gender enum('female', 'male', 'unknown' ), 
ET_IQ int not null, 
ET_Gmath int not null,
ET_English int not null,
training_class char(10) not null, 
evaluation_notes varchar(50)
);
alter table Trainee add constraint CK_IQ CHECK(ET_IQ > 0 and ET_IQ <= 20)

alter table Trainee add constraint CK_Gmath CHECK(ET_Gmath > 0 and ET_Gmath <= 20)
alter table Trainee add constraint CK_English CHECK(ET_English > 0 and ET_English <= 50)
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
