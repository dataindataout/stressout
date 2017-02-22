set global general_log='OFF';
alter table mysql.general_log engine=MyISAM;
alter table mysql.general_log add index(event_time);
alter table mysql.general_log add index(thread_id);
set global general_log='ON';
