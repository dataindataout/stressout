-- ================
-- Thread ID: 131
-- Thread Start Time: 2016-06-13 23:25:25.057149
-- ================
-- Query Start Time: 2016-06-13 23:25:25.057213
sleep(6.4e-05)
rs = db_query('select count(*) from t1')
-- ================
-- Query Start Time: 2016-06-13 23:25:25.186092
sleep(0.128879)
rs = db_query('select intcol2 from t1 where intcol1>424238330')
-- ================
-- Query Start Time: 2016-06-13 23:25:25.348898
sleep(0.162806)
rs = db_query('select charcol1 from t1 where intcol1>100')
-- ================
