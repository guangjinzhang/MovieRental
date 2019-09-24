create table dvdlog
(curent_date date,
username varchar2(30),
operation varchar2(30),
tapeid number(3)); 

create or replace trigger guangjinzhang_trig_dvd
before delete or insert or update
on dvd
for each row
begin
    if inserting then
        :new.tapeid:=trim(upper(:new.tapeid));
        :new.title:=trim(upper(:new.title));
        :new.yearr:=trim(upper(:new.yearr));
        :new.datepurchased:=trim(upper(:new.datepurchased));
        :new.costt:=trim(upper(:new.costt));
        :new.catid:=trim(upper(:new.catid));
        :new.rentedout:=trim(upper(:new.rentedout));
        :new.rating:=trim(upper(:new.rating));
        :new.actiononreturn:=trim(upper(:new.actiononreturn));
        :new.reservedby:=trim(upper(:new.reservedby));
        insert into dvdlog
        values (sysdate,user,'insert',:new.tapeid);
    end if;
    if updating then
        insert into dvdlog
        values (sysdate,user,'updating',:old.tapeid);
    end if;
    if deleting then
        insert into dvdlog
        values (sysdate,user,'delete',:old.tapeid);
    end if;
end;
/

insert into dvd values(111,'    lowercase    ','2016','17-03-05',8,1,'Y','A','KEEP IT','HK');
update dvd set reservedby='TS' where tapeid=111;
delete from dvd where tapeid=111;
select * from dvdlog;

       
