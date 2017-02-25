pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")

function sleep(n)
   os.execute("sleep " .. tonumber(n))
end

function thread_init(thread_id)
   set_vars()
end

function event(thread_id)

-- ================
-- Thread ID: 128
-- Thread Start Time: 2016-06-13 23:25:24.528546
-- ================
-- Query Start Time: 2016-06-13 23:25:24.539659
sleep(0.011113)
rs = db_query('select count(*) from t1')
-- ================
-- Query Start Time: 2016-06-13 23:25:24.655903
sleep(0.116244)
rs = db_query('select intcol2 from t1 where intcol1>424238330')
-- ================
-- Query Start Time: 2016-06-13 23:25:24.816774
sleep(0.160871)
rs = db_query('select charcol1 from t1 where intcol1>100')
-- ================

end
