insert into myapp_user (id, joined_date, name, email, is_guest)
select 
seq.n id ,
date_format(
        adddate('2019-1-1', floor(rand() * 300)), 
        '%Y-%m-%d'
    ) date,
concat('user', cast(FLOOR(rand() * 1000) as char)) name,
concat(cast(FLOOR(rand() * 1000) as char), '@test.com') email,
1
from 
(select 
(select coalesce(max(id),0) from myapp_user)  + (@num:=@num+1) n
from 
(select 
'x'
from django_migrations p
limit 10) s,
(select @num:=0) num
) seq;

insert into myapp_user (id, joined_date, registration_date, name, email, is_guest)
select 
id,
date_format(
        adddate(date, floor(rand() * 30)), 
        '%Y-%m-%d'
    ) joined_date,
date,
name,
email,
0
from (
select 
seq.n id ,
date_format(
        adddate('2019-1-1', floor(rand() * 300)), 
        '%Y-%m-%d'
    ) date,
concat('user', cast(FLOOR(rand() * 1000) as char)) name,
concat(cast(FLOOR(rand() * 1000) as char), '@test.com') email
from 
(select 
(select coalesce(max(id),0) from myapp_user)  + (@num:=@num+1) n
from 
(select 
'x'
from django_migrations p
limit 10) s,
(select @num:=0) num
) seq
) q;

insert into myapp_task(id)
select 
n
from 
(select 
(select coalesce(max(id),0) from myapp_task)  + (@num:=@num+1) n
from 
(select 
'x'
from django_migrations p
limit 3) s,
(select @num:=0) num
) seq;

