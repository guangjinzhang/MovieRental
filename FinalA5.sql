create or replace procedure GuangjinZhang_procedure
(v_fname customer.fname%type,
v_lname customer.lname%type,
v_count out number)
as
begin
select count(*)
into v_count from dvd d,customer c 
where upper(c.fname)=upper(v_fname) 
and upper(c.lname)=upper(v_lname) and c.custid=d.reservedby
group by c.custid;
end;
/

set serveroutput on;
accept p_fname prompt 'enter fname:';
accept p_lname prompt 'enter lname:';
declare
v_count number;
begin
GuangjinZhang_procedure('&p_fname','&p_lname',v_count);
dbms_output.put_line('&p_fname'||CHR(9)||'&p_lname'||' reserved '
||v_count||' movies.');
exception
when others then
dbms_output.put_line('No customer found!');
end;
/