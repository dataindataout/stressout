-- ================
-- Thread ID: 134
-- Thread Start Time: 2016-06-13 23:25:29.753508
-- ================
-- Query Start Time: 2016-06-13 23:25:29.754330
sleep(0.000822)
rs = db_query('select @@version_comment limit 1')
-- ================
-- Query Start Time: 2016-06-13 23:25:34.806034
sleep(5.051704)
rs = db_query('select * from mysql.general_log')
-- ================
