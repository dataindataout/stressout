-- ================
-- Thread ID: 129
-- Thread Start Time: 2016-06-13 23:25:24.529036
-- ================
-- Query Start Time: 2016-06-13 23:25:24.529150
sleep(0.000114)
rs = db_query('select count(*) from t1')
-- ================
-- Query Start Time: 2016-06-13 23:25:24.638381
sleep(0.109231)
rs = db_query('select intcol2 from t1 where intcol1>424238330')
-- ================
-- Query Start Time: 2016-06-13 23:25:24.820713
sleep(0.182332)
rs = db_query('select charcol1 from t1 where intcol1>100')
-- ================
