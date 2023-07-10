        --      Taxis2      --

--1--        
select Name
from App_user
where name like '%a%a';

select Name
from App_user
where length(name)- length(replace(name, 'a', ''))=2;
--2--
select alias 
from location_names
where zip_code in
    (select destination
    from booking_Destinations
    minus
        select bd.destination
        from booking b join booking_Destinations bd
        on b.booking_id = bd.booking_id
        join app_user a
        on a.phone_num = b.driver
        where a.name = 'Mathias');

--3--
select a.Name,sum(b.Distance_Travelled)as "total distance",sum(c.basic_fare*b.distance_travelled)"earnings"
from app_user a join booking b
on b.driver = a.phone_num
join car_type c
on b.car_type = c.car_type_name;

--4--
select distinct(app.name)
from  app_user app
where not exists
            (select b.pickup_location
            from booking b
            join app_user a
            on a.phone_num = b.driver
            where  a.name = 'Mathias'
            minus
                (select b.pickup_location
                from booking b
                join app_user a
                on a.phone_num = b.driver
                where a.nev = app.nev and a.nev != 'Mathias'));
        
--5--
select distance, count(distance)
from Locations_Info
group by distance
having count(distance) = 1
order by distance desc
fetch first 1 row only;

select max(distance)
from
(select distance
from locations_info
group by distance
having count(distance) = 1
order by distance desc
fetch first 1 row only);

select max(li1.distance)
from locations_info li1
where not exists 
( select li2.distance 
  from locations_info li2
  where li2.distance = li1.distance and li2.end_loc <> li1.end_loc);
  
--6--
select a.name
from app_user a join booking b
on a.phone_num =  b.commuter
group by a.name
having count(b.pickup_location) < (select count(pickup_location)
                            from booking b join app_user a
                            on a.phone_num = b.commuter
                            where a.name = 'Celine');

--7--
(select start_loc,end_loc,distance
from locations_info
order by distance desc
fetch first 3 row only)

union all

(select start_loc,end_loc,distance
from locations_info
order by distance asc
fetch first 3 row only);


--8--
select phone_numb,name