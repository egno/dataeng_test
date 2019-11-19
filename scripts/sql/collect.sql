insert into events 
select 
    id ,
    toDate(time) ,
    time,
    user_id ,
    joined_date ,
    registration_date,
    name ,
    email ,
    is_guest ,
   	step_id ,
    action_id 
from src_events
where 
((select count(time) from events) = 0)
or time >= (select max(time) from events);

optimize table events;