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
insert into department (departmentName) values ('training'),( 'sale'), ('marketing'), ('accounting'), ('human resources');
insert into Position1 (PositionName) values ('Dev'), ('Tester'), ('Designer'), ('PM'), ('BA')
insert into Account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('dev@gmail.com', 'haianh', 'Nguyễn Hải Anh', 1, 1, '2023-01-12'),
('tester@gmail.com', 'thaonguyen', 'Đỗ Thảo Nguyên', 1, 2, '2023-12-13'),
('designer@gmail.com', 'thienphuc', 'Nguyễn Thiên Phúc', 3, 3, '2023-10-01'),
('itmee@gmail.com', 'kimanh', 'Trần Kim Anh', 4, 5, '2023-12-01'),
('windy@gmail.com', 'hauu', 'Nguyễn Thuý Hậu', 5, 4, '2023-12-10')

-- delete from Account where AccountID = 2
select *from question;
insert into groupp(groupName, creatorID, createdate) values 
('group_dev', 'CID01', '2023-09-12'),
('group_tester', 'CID02', '2023-01-02'),
('group_design', 'CID03', '2022-01-02'),
('group_pm', 'CID04', '2023-08-09'),
('group_ba', 'CID05', '2021-08-09') 
-- viết trigger để check date 2 bảng trước khi insert
insert into groupaccount values
(1,1,'2023-09-15'), 
(2,3, '2023-09-13'),
(3,4, '2022-12-14'),
(4,5, '2023-10-15'),
(5,2, '2021-08-16')

insert into typequestion(typename) values ('essay'), ('multiple-choice'), ('interview'), ('practice');
insert into categoryquestion(categoryname) values ('Java'), ('.Net'), ('SQL'), ('Postman'), ('Ruby')
insert into question(content, categoryID, typeID, creatorID, createdate) values
('Thế nào là lập trình hướng đối tượng', 1, 1, 'CIDQ01', '2023-10-20'),
('Ngôn ngữ nào mà .NET hỗ trợ', 2,2, 'CIDQ02', '2023-10-21'),
('DML và DDL là gì', 3, 3, 'CIDQ03', '2023-10-22'),
('Postman là gì', 4, 4, 'CIDQ04','2023-10-23');

alter table answer modify column content varchar(200)
insert into answer(content, questionID, iscorrect) VALUES
('Ruby On rails là một Framework cho phép phát triển ứng dụng Web', 4, 'true'),
('DDL là : create. DML là(data manipulation L) ngôn ngữ định nghĩa dữ liệu: create, alter, drop, rename', 3, 'true'),
('Lập trình hướng đối tượng là phương pháp lập trình dựa trên lớp và đối tượng', 1, 'true'),
('Ngôn ngữ mà .NET hỗ trợ là C#, F#,..', 2, 'true');

insert into exam(code, title, categoryID, duration, creatorID, createdate) values 
('Test1', 'Bài kiểm tra giữa kì', 1, '00:45:00', 'CIDE01', '2021-10-26'),
('Test2', 'Bài kiểm tra khảo sát', 2, '00:30:00', 'CIDE02',  '2021-10-27'),
('Test3', 'Bài kiểm tra cuối kì', 3, '00:10:00', 'CIDE03', '2021-10-28'),
('Test4', 'Phỏng vấn nhanh', 4, '00:10:00', 'CIDE04', '2021-10-29'),
('Test5', 'Thực hành', 5, '00:40:00', 'CIDE05', '2021-10-30')
alter table exam auto_increment=1;
 select *from exam where examID=1
insert into examquestion values (1,1), (2,2), (3,3), (4,4)
select *from examquestion
====
insert into Department (DepartmentName) values ('Audit'), ('Administration'), ('Customer services'), ('Financial') , ('Research and development') 
insert into position1(PositionName) values ('Manager'), ('President'), ('Director'), ('Secretary'), ('Receptionist')
insert into account (Email, Username, FullName, DepartmentID, PositionID, CreateDate) values
('person7@gmail.com', 'thien983', 'Do Kim Thien', 10, 3, '2020-01-13'),
('person1@gmail.com', 'rihana123', 'Rihana_Dimonds', 2, 7, '2020-01-14'),
('person2@gmail.com', 'adele345', 'Adele', 7, 8, '2021-12-10' ),
('person3@gmail.com', 'beyonce567', 'Beyonce', 1, 9, '2020-09-18' ),
('person4@gmail.com', 'taylor789', 'Taylor Swift', 3, 10, '2002-09-18' ),
('person5@gmail.com', 'andrea', 'Andera Aybar', 5, 6, '2010-10-10' ),
('person6@gmail.com', 'thientao123', 'Do Thien Tao', 10, 3, '2020-01-14'),
insert into groupp (groupName, creatorID, createdate) values 
('group_sale', 'CID06', '2023-09-15'),
('group_7', 'CID07', '2023-10-02'),
('group_8', 'CID08', '2022-10-20'),
('group_9', 'CID09', '2023-10-20'),
('group_10', 'CID010', '2022-08-09')
insert into groupaccount values
(6,1,'2023-02-12'), 
(7,10, '2023-10-20'),
(8,7, '2023-01-14'),
(9,6, '2023-10-21'),
(10,8, '2022-12-16')
update groupaccount set joindate = '2022-12-16' where groupID='10'
select *from groupaccount
insert into typequestion(typename) values ('type5'), ('type6'),('type7'), ('type8'), ('type9'), ('type10')
insert into categoryquestion(categoryname) values ('Android'), ('C++'), ('C#'), ('VB'), ('Python')
insert into question(content, categoryID, typeID, creatorID, createdate) values
('Câu hỏi: Thế nào là 1 object?', 8, 2, 'CIDQ01', '2022-10-20'),
('Con trỏ trong C++ là gì?', 7,3, 'CIDQ05', '2009-10-21'),
('PEP 8 là gì', 10, 10, 'CIDQ04', '2023-10-10'),
('Vòng đời Activity là gì', 6, 4, 'CIDQ03','2023-10-01'),
('Có mấy loại Intent', 6, 1, 'CIDQ02','2013-12-12'),
('Namespaces trong Python là gì', 10, 2, 'CIDQ02','2019-12-12')

insert into answer(content, questionID, iscorrect) VALUES
('Lập trình hướng đối tườn-OOP được viết tắt là Object Oriented Programming', 1, 'true'),
('Object là 1 thực thể cụ thể của 1 class, nó bao gồm các thuộc tính và phương thức', 5, 'true'),
('Con trỏ(pointer) là 1 biến dùng để lưu trữ địa chỉ của 1 biên khác', 6, 'true'),
('là tập hợp các chỉ dẫn về định dạng code, phong cách lập trình được chia sẻ chung giữa các lập trình viên Python', 7, 'true'),
('Vòng đời activity được nhắc đến để thể hiện 1 chuỗi hoạt động của 1 ứng dụng trong android theo thứ tự của các callback: onCreate, onStart, onResume', 8, 'true'),
('Lập trình hướng đối tượng có 4 tính chất: kế thừa, đóng gói, đa hình, trừu tượng', 1, 'true'),
('Lập trình hướng đối tượng gồm 2 thành phần là  method và attributes', 1, 'true')

insert into exam(code, title, categoryID, duration, creatorID, createdate) values 
('Test6', 'Bài kiểm tra giữa kì', 2, '00:45:00', 'CIDE01', '2022-04-19'),
('Test7', 'Bài kiểm tra khảo sát', 7, '00:30:00', 'CIDE02',  '2021-10-27'),
('Test8', 'Bài kiểm tra cuối kì', 8, '01:30:00', 'CIDE04', '2018-10-28'),
('Test9', 'Phỏng vấn nhanh', 9, '00:10:00', 'CIDE05', '2021-10-29'),
('Test10', 'Thực hành', 5, '00:25:00', 'CIDE05', '2016-10-30')
select *from groupaccount  
insert into examquestion values (1,5), (1,6), (2,9), (2,10), (6,9), (7, 1), (10, 4), (3,8), (5,4)
-- Q3: lay ra id cua phong ban sale
select departmentID from department where departmentName like 'sale'
-- Q4: lay ra account co fullname dai nhat
select * from account where char_length(fullname) = 
(select char_length(fullname) from account order by char_length(fullname) desc limit 1) 
-- Q5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
select * from account where char_length(fullname) = 
(select char_length(fullname) from account order by char_length(fullname) desc limit 1) and departmentID =3
-- Q6: Lấy ra tên group trước ngày 20/12/2019
update groupp set createdate = '2018-12-21' where groupID = 9
select *from groupp  where createdate <= '2019-12-20'
-- Q7: lấy ra id của question có >= 4 câu trả lời
select question.QuestionID, question.content 
from question  where question.QuestionID = 
(select  question.QuestionID from question inner join answer where question.QuestionID = answer.questionID 
group by question.QuestionID  having count(question.QuestionID)>=4 )
-- Q8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
select *from exam 
select *  from exam where duration >= '00:60:00' and createdate < '2019-12-20'
-- Q9: Lấy ra 5 group được tạo gần đây nhất
select *from groupp order by createdate desc limit 5
-- Q10: Đếm số nhân viên thuộc department có id = 2
select departmentID  , count(accountID) as `số lượng nhân viên` from account 
where departmentID = 2 group by departmentID 
-- Q11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
select *from account where left (fullname, 1) like 'D' and right (fullname, 1) like 'o'
-- Q12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
delete from account where fullname = 'Do Kim Thien'
select * from account  where createdate < '2019-12-20'
delete from exam where createdate < '2019-12-20'
(select * from exam where createdate < '2019-12-20')