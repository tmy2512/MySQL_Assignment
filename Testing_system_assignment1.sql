create database testing_system_assignment;
use testing_system_assignment;

create table department(
departmentID int not null auto_increment primary key,
departmentName varchar(50) not null
);
create table position1(
positionID int not null primary key auto_increment,
positionName varchar(40) not null
);
create table account(
accountID int not null primary key auto_increment,
email varchar(30) not null, 
username varchar(40) not null,
fullname varchar(40) not null,
departmentID int not null, 
positionID int not null, 
createdate date not null,
constraint FK_departmentid foreign key (departmentID) references department(departmentID),
constraint FK_positionid foreign key(positionID) references position1(positionID)
);
create table groupp(
groupID int not null auto_increment primary key, 
groupName varchar(30) not null,
creatorID char(10) not null,
createdate date not null
);
create table groupaccount(
groupID int not null,
accountID int not null,
joindate date not null,
constraint FK_groupid foreign key(groupID) references groupp(groupID),
constraint FK_accountid foreign key(accountID) references account(accountID)
);
-- alter table groupaccount add constraint CK_joindate check(joindate >= (select createdate from groupp where groupID = groupID))
-- alter table account add constrain DK_ac
CREATE TABLE typequestion( 
typeID int not null auto_increment primary key,    
typename varchar(30) not null);
create table CategoryQuestion(
categoryID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
categoryName varchar(30) not null
)
CREATE table Question(
QuestionID int not null auto_increment primary key,
content varchar(60) not null,
categoryID int not null,
typeID int not null,
creatorID char(10) not null,
createDate date not null
);
alter table Question add constraint FK_categoryid foreign key(categoryID) references CategoryQuestion(categoryID);
alter table Question add constraint FK_typeid foreign key(typeID) references typequestion(typeID);
create table Answer(
answerID int not null auto_increment primary key,
content varchar(60) not null,
questionID int not null,
isCorrect ENUM('true', 'false'),
constraint FK_questionid foreign key(questionID) references Question(questionID)
)
create table Exam(
examID int not null auto_increment primary key,
code char(10) not null,
title varchar(50) not null ,
categoryID int not null,
duration time not null,
creatorID int not null, 
createdate date not null,
constraint FK_categoryid2 foreign key(categoryID) references  CategoryQuestion(categoryID)
)
alter table Exam modify creatorID char(10)
create table examquestion(
examID int not null,
questionID int not null,
constraint FK_qsID FOREIGN KEY(questionID) references Question(questionID),
constraint FK_exID foreign key(examID) references exam(examID)
)
-- alter table examquestion add constraint FK_qsID FOREIGN KEY(questionID) references Question(questionID)
-- alter table examquestion drop constraint FK_qsID
-- insert into data 
