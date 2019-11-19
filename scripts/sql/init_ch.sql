CREATE TABLE IF NOT EXISTS src_events
(
    id UInt32,
    time DateTime,
    user_id UInt32,
    joined_date date,
    registration_date date,
    name String,
    email String,
    is_guest UInt8,
   	step_id UInt8,
    action_id UInt32
) ENGINE = MySQL('db:3306', 'django_app', 'event_details', 'django_app', 'django_app123');


CREATE TABLE IF NOT EXISTS events
(
    id UInt32,
    date Date,
    time DateTime,
    user_id UInt32,
    joined_date Date,
    registration_date Date,
    name String,
    email String,
    is_guest UInt8,
   	step_id UInt8,
    action_id UInt32
) ENGINE = ReplacingMergeTree()
ORDER BY id;


