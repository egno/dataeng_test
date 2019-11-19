create or replace view event_details as 
select 
e.id,
e.time,
e.user_id,
u.joined_date,
u.registration_date,
u.name,
u.email,
u.is_guest,
e.target_id step_id,
e.action_id
from myapp_event e 
left join myapp_user u on u.id=e.user_id;

delimiter $$
create procedure add_events()
begin
insert into myapp_event(id, time, user_id, target_id, action_id)
select 
(select coalesce(max(id),0) from myapp_event) + (@num:=@num+1) n,
now() ts,
floor(rand() * (select max(id) from myapp_user))+1 user_id,
floor(rand() * (select max(id) from myapp_task))+1 task_id,
floor(rand() * 3) action_id
from myapp_task t, 
myapp_user u,
(select @num:=0) num
limit 10;
end 
$$
delimiter ;
