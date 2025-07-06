create database blood_donation;
use  er;
create table hospital(hid int,hname varchar(30),city varchar(30)
					 ,street varchar(30),state varchar(30),
                     primary key (hid)
                     );
INSERT INTO HOSPITAL VALUES(1,'HIRANANDANI','THANE','ESTATE','MAHARASHTRA');
INSERT INTO HOSPITAL VALUES(2,'JUPITER','THANE','LBS','MAHARASHTRA');
INSERT INTO HOSPITAL VALUES(3,'ROHINI','WARANGAL','NIT ROAD','TELANGANA');
create table blood_bank(hid int,bid int,capacity int,
                        primary key(hid,bid));
insert into blood_bank values(1,1,100);
insert into blood_bank values(2,2,120);
-- ------------------------------------------------------------- --
create table hospital_contact(contact int,hid int,
                              primary key(hid,contact),
                              foreign key (hid) references
							  hospital(hid));
							
create table donor(did int,name_ varchar(30),location varchar(30),
				  blood_group varchar(5),last_donate date,
                  hid int,bid int,
                  primary key(did,hid,bid),
                  foreign key(hid,bid) references blood_bank(hid,bid));
INSERT INTO donor (did, name_, location, blood_group, last_donate, hid, bid,AGE,DISEASED)
VALUES (1, 'HERAMB', 'THANE', 'AB+', '2023-03-27', 1, 1,20,FALSE);

INSERT INTO DONOR (did, name_, location, blood_group, last_donate, hid, bid,AGE,DISEASED) 
values(2,'PRANAV','THANE','B+','2022-02-24',1,1,22,FALSE);

INSERT INTO DONOR (did, name_, location, blood_group, last_donate, hid, bid,age,diseased) 
values(3,'SIDDH','THANE','A-','2022-02-24',1,1,21,FALSE);

INSERT INTO DONOR (did, name_, location, blood_group, last_donate, hid, bid,age,diseased) 
values(4,'SHIRISH','THANE','AB+','2020-02-24',1,1,23,TRUE);

INSERT INTO DONOR (did, name_, location, blood_group, last_donate, hid, bid,age,diseased) 
values(5,'HARSH','THANE','O-','2018-02-24',2,2,43,FALSE);

INSERT INTO DONOR (did, name_, location, blood_group, last_donate, hid, bid,age,diseased) 
values(6,'PARTH','THANE','O+','2017-01-30',2,2,40,TRUE);

INSERT INTO DONOR (did, name_, location, blood_group, last_donate, hid, bid,age,diseased) 
values(7,'RONIT','THANE','AB-','2019-06-05',2,2,54,FALSE);

INSERT INTO DONOR (did, name_, location, blood_group, last_donate, hid, bid,age,diseased) 
values(8,'BHUSHAN','THANE','B-','2011-06-05',2,2,45,FALSE);
SELECT * FROM DONOR;
                  
alter table donor
add age int;

alter table donor
add diseased bool;
		
create table blood_count(blood_group varchar(5),quantity int,
						hid int,bid int,
                        primary key(hid,bid,blood_group),
                        foreign key (hid,bid) references blood_bank(hid,bid));
insert into blood_count values('AB+',0,1,1);
insert into blood_count values('AB-',0,1,1);
insert into blood_count values('B+',0,1,1);
insert into blood_count values('B-',0,1,1);
insert into blood_count values('A+',0,1,1);
insert into blood_count values('A-',0,1,1);
insert into blood_count values('O+',0,1,1);
insert into blood_count values('O-',0,1,1);

insert into blood_count values('AB+',0,2,2);
insert into blood_count values('AB-',0,2,2);
insert into blood_count values('B+',0,2,2);
insert into blood_count values('B-',0,2,2);
insert into blood_count values('A+',0,2,2);
insert into blood_count values('A-',0,2,2);
insert into blood_count values('O+',0,2,2);
insert into blood_count values('O-',0,2,2);

create table recepient(rid int,name_ varchar(30),
                     blood_group varchar(5),location varchar(30),
					 hid int,bid int,
                     primary key(hid,bid,rid),
                     foreign key(hid,bid) references blood_bank(hid,bid));

create table staff(staff_id int,d_o_join date,contact int,hid int,bid int,
                  primary key(hid,bid,staff_id),
                  foreign key(hid,bid) references blood_bank(hid,bid));
INSERT INTO STAFF VALUES(101,'2020-07-18',12345,1,1);
INSERT INTO STAFF VALUES(102,'2021-05-10',54321,1,1);
INSERT INTO STAFF VALUES(103,'2022-02-18',21435,1,1);
INSERT INTO STAFF VALUES(104,'2013-07-18',12346,1,1);
INSERT INTO STAFF VALUES(105,'2022-01-07',12543,1,1);

INSERT INTO STAFF VALUES(201,'2021-07-18',98765,2,2);
INSERT INTO STAFF VALUES(202,'2021-05-10',56789,2,2);
INSERT INTO STAFF VALUES(203,'2012-02-18',56879,2,2);
INSERT INTO STAFF VALUES(204,'2014-07-18',57969,2,2);
INSERT INTO STAFF VALUES(205,'2015-01-07',76985,2,2);
				
use er;
CREATE TABLE COMPAT(dbg varchar(5),rbg varchar(5),
                    primary key (dbg,rbg));
insert into COMPAT values('O-','AB+');
insert into COMPAT values('O-','AB-');
insert into COMPAT values('O-','B+');
insert into COMPAT values('O-','B-');
insert into COMPAT values('O-','A+');
insert into COMPAT values('O-','A-');
insert into COMPAT values('O-','O+');
insert into COMPAT values('O-','O-');

insert into COMPAT values('O+','AB+');
insert into COMPAT values('O+','B+');
insert into COMPAT values('O+','A+');
insert into COMPAT values('O+','O+');

insert into COMPAT values('A-','AB+');
insert into COMPAT values('A-','AB-');
insert into COMPAT values('A-','A+');
insert into COMPAT values('A-','A-');

insert into COMPAT values('A+','AB+');
insert into COMPAT values('A+','A+');

insert into COMPAT values('B-','AB+');
insert into COMPAT values('B-','AB-');
insert into COMPAT values('B-','B+');
insert into COMPAT values('B-','B-');

insert into COMPAT values('B+','AB+');
insert into COMPAT values('B+','B+');

insert into COMPAT values('AB-','AB+');
insert into COMPAT values('AB-','AB-');

insert into COMPAT values('AB+','AB+');

update blood_count
set quantity=quantity+0.5
WHERE (blood_group) IN (select blood_group from donor);insert into hospital values(3,'AIIMS_Jodhpur','Jodhpur','Pal_road','Rajasthan');
insert into hospital values(4,'GMCH','Jalore','Ring_road','Rajasthan');
insert into hospital values(5,'SMS','Jaipur','Moti_road','Rajasthan');
insert into hospital values(6,'GOVT_hospital','Jaipur','Rambagh_street','Rajasthan');

insert into blood_bank values(3,3,120);
insert into blood_bank values(4,4,110);
insert into blood_bank values(5,5,115);
insert into blood_bank values(6,6,120);

insert into hospital_contact values(9912943489,3);
insert into hospital_contact values(9817743488,4);
insert into hospital_contact values(8912943489,5);
insert into hospital_contact values(8812943489,6);


insert into donor values (11, 'Abhishek', 'Jaipur', 'A+', '2023-10-15', 3, 3,20,0);
insert into donor values (12, 'Priya_Sharma', 'Mumbai', 'B-', '2023-11-20', 4, 4,30,0);
insert into donor values (13, 'Ramesh_Patel', 'Jodhpur', 'O+', '2023-09-05', 3, 3,34,0);
insert into donor values (14, 'Sunita_Singh', 'Jalore', 'AB+', '2023-12-18', 5, 5,24,0);
insert into donor values (15, 'Amit_Gupta', 'Jaipur', 'A-', '2023-08-30', 3, 3,43,0);
insert into donor values (16, 'Anjali_Devi', 'Mumbai', 'B+', '2023-10-25', 3,3,21,0);
insert into donor values (17, 'Sandeep_Mishra', 'Jodhpur', 'O-', '2023-11-12', 4, 4,55,0);
insert into donor values (18, 'Muskan_Tiwari', 'Mumbai', 'AB-', '2023-09-28', 4, 4,23,0);
insert into donor values (19, 'Rajesh_Kumar', 'Jaipur', 'A+', '2023-11-05', 5, 5,29,0);
insert into donor values (20, 'Meera_Singh', 'Jalore', 'B-', '2023-10-10', 5, 5,41,0);
insert into donor values (21, 'Arun_Sharma', 'Mumbai', 'O+', '2023-12-22', 6, 6,62,0);
insert into donor values (22, 'Kavita_Reddy', 'Jodhpur', 'AB+', '2023-09-15', 6,6,36,0);
insert into donor values (23, 'Sanjay_Kumar', 'Jaipur', 'A-', '2023-11-18', 6,6,27,0);
insert into donor values (24, 'Pooja_Patel', 'Mumbai', 'B+', '2023-10-05', 5,5,71,0);
insert into donor values (25, 'Durgesh_Mishra', 'Jodhpur', 'O-', '2023-08-20',6,6,18,0);
insert into donor values (26, 'Anita_Verma', 'Jaipur', 'AB-', '2023-12-28', 4,4,19,0);
insert into donor values (27, 'Raj_Kumar', 'Mumbai', 'A+', '2023-09-02', 5,5,18,0);
insert into donor values (28, 'Radha_Gupta', 'Jodhpur', 'B-', '2023-10-30', 3,3,29,0);
insert into donor values (29, 'Suresh_Yadav', 'Jaipur', 'O+', '2023-11-15', 5,5,31,0);
insert into donor values (30, 'Kiran_Singh', 'Mumbai', 'AB+', '2023-09-08', 6,6,19,0);

--insertion inblood _count
INSERT INTO blood_count VALUES ('A+', 42, 3, 3);
INSERT INTO blood_count VALUES ('A+', 75, 4, 4);
INSERT INTO blood_count VALUES ('A+', 18, 5, 5);
INSERT INTO blood_count VALUES ('A+', 93, 6, 6);

INSERT INTO blood_count VALUES ('A-', 65, 3, 3);
INSERT INTO blood_count VALUES ('A-', 30, 4, 4);
INSERT INTO blood_count VALUES ('A-', 88, 5, 5);
INSERT INTO blood_count VALUES ('A-', 12, 6, 6);

INSERT INTO blood_count VALUES ('B+', 82, 3, 3);
INSERT INTO blood_count VALUES ('B+', 47, 4, 4);
INSERT INTO blood_count VALUES ('B+', 55, 5, 5);
INSERT INTO blood_count VALUES ('B+', 39, 6, 6);

INSERT INTO blood_count VALUES ('B-', 23, 3, 3);
INSERT INTO blood_count VALUES ('B-', 81, 4, 4);
INSERT INTO blood_count VALUES ('B-', 44, 5, 5);
INSERT INTO blood_count VALUES ('B-', 69, 6, 6);

INSERT INTO blood_count VALUES ('AB+', 90, 3, 3);
INSERT INTO blood_count VALUES ('AB+', 15, 4, 4);
INSERT INTO blood_count VALUES ('AB+', 37, 5, 5);
INSERT INTO blood_count VALUES ('AB+', 58, 6, 6);

INSERT INTO blood_count VALUES ('AB-', 50, 3, 3);
INSERT INTO blood_count VALUES ('AB-', 64, 4, 4);
INSERT INTO blood_count VALUES ('AB-', 78, 5, 5);
INSERT INTO blood_count VALUES ('AB-', 26, 6, 6);

INSERT INTO blood_count VALUES ('O+', 97, 3, 3);
INSERT INTO blood_count VALUES ('O+', 9, 4, 4);
INSERT INTO blood_count VALUES ('O+', 71, 5, 5);
INSERT INTO blood_count VALUES ('O+', 33, 6, 6);

INSERT INTO blood_count VALUES ('O-', 22, 3, 3);
INSERT INTO blood_count VALUES ('O-', 85, 4, 4);
INSERT INTO blood_count VALUES ('O-', 56, 5, 5);
INSERT INTO blood_count VALUES ('O-', 41, 6, 6);

--insertion in recepient
INSERT INTO recepient VALUES (10, 'Rahul', 'A+', 'Jaipur', 3, 3);
INSERT INTO recepient VALUES (11, 'Priya', 'B-', 'Jodhpur', 3, 3);
INSERT INTO recepient VALUES (12, 'Raja_Singh', 'O+', 'Jaipur', 4, 4);
INSERT INTO recepient VALUES (13, 'Sunita', 'AB+', 'Jodhpur', 5, 5);
INSERT INTO recepient VALUES (14, 'Ayush_Gupta', 'A-', 'Jaipur', 6, 6);
INSERT INTO recepient VALUES (15, 'Anamitra', 'B+', 'Jodhpur', 3, 3);
INSERT INTO recepient VALUES (16, 'Sudeep', 'O-', 'Jalore', 4, 4);
INSERT INTO recepient VALUES (17, 'Sneha', 'AB-', 'Jaipur', 5, 5);
INSERT INTO recepient VALUES (18, 'Rahul', 'A+', 'Jaipur', 6, 6);
INSERT INTO recepient VALUES (19, 'Mika_Singh', 'B-', 'Jalore', 3, 3);
INSERT INTO recepient VALUES (20, 'Aditi', 'O+', 'Jodhpur', 4, 4);
INSERT INTO recepient VALUES (21, 'Venkat_Reddy', 'AB+', 'Jaipur', 5, 5);
INSERT INTO recepient VALUES (22, 'Sanjay_Goyal', 'A-', 'Jodhpur', 6, 6);
INSERT INTO recepient VALUES (23, 'Akshar_Patel', 'B+', 'Jaipur', 3, 3);
INSERT INTO recepient VALUES (24, 'Rohit_Sharma', 'O-', 'Jalore', 4, 4);

--insertion in staff
INSERT INTO staff VALUES (10, '2022-05-15', 9123456780, 3, 3);
INSERT INTO staff VALUES (11, '2022-06-20', 9876543210, 3, 3);
INSERT INTO staff VALUES (12, '2022-07-25', 8765432109, 4, 4);
INSERT INTO staff VALUES (13, '2022-08-30', 9345678901, 4, 4);
INSERT INTO staff VALUES (14, '2022-09-10', 8456789012, 5, 5);
INSERT INTO staff VALUES (15, '2022-10-15', 9567890123, 5, 5);
INSERT INTO staff VALUES (16, '2022-11-20', 5678901234, 6, 6);
INSERT INTO staff VALUES (17, '2022-12-25', 6789012345, 6, 6);
INSERT INTO staff VALUES (18, '2023-01-30', 7890123456, 3, 3);
INSERT INTO staff VALUES (19, '2023-02-05', 8901234567, 3, 3);

select * from donor;
SELECT * FROM BLOOD_COUNT;
SELECT * FROM STAFF;
SELECT * FROM BLOOD_BANK;
