create table moviecategory (catid number(3),catname varchar2(30),
constraint pk_catid primary key (catid));

create table customer(custid varchar(3) not null,fname varchar2(30),lname varchar2(20),
phonenum number(10),birthdate date,status varchar2(30),creditcardnum number(12),
Constraint pk_cid primary key(custid));

create table dvd(tapeid number(3),title varchar2(20),yearr char(4),
datepurchased date,costt number(3,2),catid number(3),rentedout char(1),
rating varchar(10),actiononreturn varchar(50),reservedby varchar(3) null,
constraint pk_tid primary key(tapeid),constraint fk_catid FOREIGN KEY (catid) references moviecategory(catid),
constraint fk_rscust FOREIGN KEY (reservedby) references customer(custid));

create table rental(rentalid number(4),custid varchar(3),tapeid number(3),rental_date date,return_date date,constraint pk_rid primary key(rentalid),
constraint fk_custidr FOREIGN KEY (custid) references customer(custid),
constraint fk_tapeidr FOREIGN KEY (tapeid) references dvd(tapeid)
);

insert into customer values('HK','HARKAMAL','BENIPAL',4377774771,'95-08-14','ACTIVE',4567893456);
insert into customer values('BK','BALJINDER KAURA','BENIPAL',43568784,'80-06-06','ACTIVE',76476454);
insert into customer values('TS','TARANPREET','BENIPAL',9501797083,'94-01-04','INACTIVE',34765472);
insert into customer values('MS','MANPREET','SINGH',334567345,null,'ACTIVE',764764546);

insert into moviecategory values(7,'ACTION DRAMA');
insert into moviecategory values(8,'REALREALITY');
insert into moviecategory values(1,'HORROR');
insert into moviecategory values(2,'KIDS');
insert into moviecategory values(3,'ROMANTIC');
insert into moviecategory values(4,'BIOGRAPHY');
insert into moviecategory values(5,'DRAMA');

insert into dvd values(101,'ALL IS WELL','2014','17-09-09',5,1,'Y','A','KEEP IT','TS');
insert into dvd values(102,'The GOLDEN','2012','12-03-03',4,2,'Y','R','KEEP','BK');
insert into dvd values(105,'RIGHT OR WRONG','2013','18-05-05',8,3,'N','G','NOTHING',null);
insert into dvd values(103,'THE CONNECTICUT','2017','16-02-02',9,1,'N','A','KEEP IT',null);
insert into dvd values(104,'MR GREY','2016','16-03-05',8,3,'Y','A','KEEP IT','HK');
insert into dvd values(106,'MR','2016','16-03-05',8,3,'Y','A','KEEP IT','HK');

insert into rental values(207,'HK',103,'16-03-03','16-03-16');
insert into rental values(201,'TS',101,'18-03-26',null);
insert into rental values(202,'HK',102,'18-03-30',null);
insert into rental values(205,'MS',103,'15-03-07','15-03-10');
insert into rental values(206,'HK',104,'18-04-08',null);

