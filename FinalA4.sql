set serveroutput on;
declare
    cursor custinfo is
    select c.fname, c.lname, d.title, m.catname from customer c
    join dvd d on c.custid=d.reservedby
    join moviecategory m on d.catid=m.catid;
begin
    for v_custinfo in custinfo loop
        dbms_output.put_line ('Customer Name: '||rtrim(v_custinfo.fname)
            ||chr(9)||rtrim(v_custinfo.lname)
            ||chr(10)||'DVD Title: '||rtrim(v_custinfo.title)
            ||chr(10)||'Movie Category: '||rtrim(v_custinfo.catname));          
        dbms_output.new_line();
    end loop;    
end;
/