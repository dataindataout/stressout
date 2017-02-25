-- ================
-- Thread ID: 133
-- Thread Start Time: 2016-06-13 23:25:25.573990
-- ================
-- Query Start Time: 2016-06-13 23:25:25.574059
sleep(6.9e-05)
rs = db_query('select count(*) from t1')
-- ================
-- Query Start Time: 2016-06-13 23:25:25.682173
sleep(0.108114)
rs = db_query('select intcol2 from t1 where intcol1>424238330')
-- ================
-- Query Start Time: 2016-06-13 23:25:25.857643
sleep(0.17547)
rs = db_query('select charcol1 from t1 where intcol1>100')
-- ================
