--  Bankos practice
--1--
select sz.lejarat
from bank b join szamla s
on b.bank_id = s.bank_id 
where b.varos like 'kecskemét';

--2--
select u.nev,count(distinct(sz.bank_id))--kulonbozo bank id-t szamol
from ugyfel u join szamla sz
on u.ugyfel_id=sz.ugyfel_id
group by u.nev;
--3--
select u.nev,SUM(sz.osszeg) as "osszeg"
from ugyfel u join szamla sz
on u.ugyfel_id = sz.ugyfel_id
where u.nev like 'Ferenc'

--4--
select u.nev,s.osszeg
from ugyfel u join szamla s
on s.ugyfel_id = u.ugyfel_id
HAVING SUM(osszeg) >= 1000000
group by u.nev;

--5--
select u.nev,SUM(osszeg) as "osszeg"
from ugyfel u join szamla s
on u.ugyfel_id = s.ugyfel_id
group by nev;
--6--
select count(distinct(gyumolcs)),count(distinct(szeret))
from szeret;
--7--

select min(szuletes)
from 
(select nev,szuletes
from ugyfel
minus
where szuletes = (select min(szuletes)
from ugyfel)));
--8--

--9--
select nev,gyumolcs
from szeret
where  
--10--
select u.nev
from ugyfel u join szamla s
on u.ugyfel_id = s.ugyfel_id
group by u.nev
having Sum(osszeg)>
    (select SUM(sz.osszeg) as "osszeg"
    from ugyfel u join szamla sz
    on u.ugyfel_id = sz.ugyfel_id
    where u.nev like 'Ferenc');
--nem jó
--11--
select b.nev
from bank b join szamla s
on b.bank_id=s.bank_id
group by b.nev --osszes bankban
having sum(osszeg)=
    (select min(sum(osszeg))
    from szamla
    group by bank_id);