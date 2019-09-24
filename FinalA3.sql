create or replace function GuangjinZhang_func_insert_dvd
(v_custid customer.custid%type,
v_fname customer.fname%type,
v_lname customer.lname%type,
v_phonenum customer.phonenum%type,
v_birthdate customer.birthdate%type,
v_status customer.status%type,
v_creditcardnum customer.creditcardnum%type
)
return varchar2 is v_message varchar2(50);
begin
insert into customer values(v_custid,v_fname,v_lname,v_phonenum,v_birthdate,v_status,v_creditcardnum);
v_message:='inserted successfully!';
return v_message;
end;
/

set serveroutput on;
accept p_custid prompt 'enter custid:';
accept p_fname prompt 'enter fname:';
accept p_lname prompt 'enter lname:';
accept p_phonenum prompt 'enter phonenum:';
accept p_birthdate prompt 'enter birthdate:';
accept p_status prompt 'enter status:';
accept p_creditcardnum prompt 'enter creditcardnum:';
begin
dbms_output.put_line(GuangjinZhang_func_insert_dvd
('&p_custid','&p_fname','&p_lname','&p_phonenum','&p_birthdate',
'&p_status','&p_creditcardnum'));
exception
when others then
dbms_output.put_line('insert error!');
end;
/