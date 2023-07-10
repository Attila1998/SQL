
            --      Taxis       --

--1
select to_char(to_date('14-Dec-1998')), to_char(to_date('14-Dec-1998'), 'Day') nap ,
            round(to_char(SYSDATE - to_date('24-Dec-1998')), 2) NapotEltem
from dual;

--2
select au.name, c.phone_num
from app_user au join commuter c
on au.phone_num = c.phone_num
where au.name = 'Jeffrey';

--3
select distance 
from locations_info
order by distance desc
fetch first 1 rows only;

--4
select  Name,Email
from App_User
order by Joined_Date desc
fetch first 4 rows only;