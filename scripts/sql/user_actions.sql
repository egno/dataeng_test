select 
`date`,
user_id,
name,
email,
groupUniqArray(action_id) actions
from events
group by `date`, user_id, name, email;