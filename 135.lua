-- ================
-- Thread ID: 135
-- Thread Start Time: 2016-06-13 23:25:45.127518
-- ================
-- Query Start Time: 2016-06-13 23:25:45.128043
sleep(0.000525)
rs = db_query('select min(event_time) as capture_start_time, max(event_time) as capture_end_time from mysql.general_log')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.128614
sleep(0.000571)
rs = db_query('select thread_id, event_time from mysql.general_log where command_type='Connect' and event_time>'2016-06-13 23:25:23.886660'and event_time<'2016-06-13 23:25:45.128043'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.130429
sleep(0.001815)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='127'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.131861
sleep(0.001432)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='128'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.133486
sleep(0.001625)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='129'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.135210
sleep(0.001724)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='130'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.136474
sleep(0.001264)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='131'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.137958
sleep(0.001484)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='132'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.139801
sleep(0.001843)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='133'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.141145
sleep(0.001344)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='134'')
-- ================
-- Query Start Time: 2016-06-13 23:25:45.142595
sleep(0.00145)
rs = db_query('select event_time, argument from mysql.general_log where command_type='Query' and thread_id='135'')
-- ================
