# turn on general logging, saved to a table
set global log_output='TABLE';
set global general_log='ON';

# convert log to myisam for quicker access by later scripts
set global general_log='OFF';
alter table mysql.general_log engine=MyISAM;
alter table mysql.general_log add index(event_time);
alter table mysql.general_log add index(thread_id);
set global general_log='ON';
