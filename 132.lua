-- ================
-- Thread ID: 132
-- Thread Start Time: 2016-06-13 23:25:25.573843
-- ================
-- Query Start Time: 2016-06-13 23:25:25.585144
sleep(0.011301)
rs = db_query('select count(*) from t1')
-- ================
-- Query Start Time: 2016-06-13 23:25:25.706423
sleep(0.121279)
rs = db_query('select intcol2 from t1 where intcol1>424238330')
-- ================
-- Query Start Time: 2016-06-13 23:25:25.863954
sleep(0.157531)
rs = db_query('select charcol1 from t1 where intcol1>100')
-- ================
