-- ================
-- Thread ID: 130
-- Thread Start Time: 2016-06-13 23:25:25.057059
-- ================
-- Query Start Time: 2016-06-13 23:25:25.074548
sleep(0.017489)
rs = db_query('select count(*) from t1')
-- ================
-- Query Start Time: 2016-06-13 23:25:25.174743
sleep(0.100195)
rs = db_query('select intcol2 from t1 where intcol1>424238330')
-- ================
-- Query Start Time: 2016-06-13 23:25:25.339400
sleep(0.164657)
rs = db_query('select charcol1 from t1 where intcol1>100')
-- ================
