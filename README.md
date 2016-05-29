# stressout
Stressing out your database.

todo:
<li>error handling</li>
<li>cross-platform testing</li>
<li>handling writes</li>
<li>sysbench scheduling using scheduler.lua</li>

## Install dependencies

You need the mysql client if you're running this on a remote machine. Here's one way to get that:
> brew install mariadb

Install lua (luarocks will come with it) and the luasql-mysql and date modules:
> brew install lua

> luarocks install luasql-mysql MYSQL_DIR=/usr/local/bin MYSQL_INCDIR=/usr/local/Cellar/mariadb/10.1.14/include/mysql

> luarocks install date

## Enable the general log in MySQL

Turn on your general log and store results in a table.

> mysql -uuser -ppassword -e"set global log_output='TABLE'"

> mysql -uuser -ppassword -e"set global general_log='ON'"

Don't forget to periodically truncate the general log table and consider turning it off after gathering queries, to avoid filling up your disk, especially on a busy server.

## Convert the general log table to MyISAM for indexed searches.

> mysql -uuser -ppassword -e"set global general_log='OFF'"

> mysql -uuser -ppassword -e"alter table mysql.general_log engine=MyISAM"

> mysql -uuser -ppassword -e"alter table mysql.general_log add index(event_time)"

> mysql -uuser -ppassword -e"alter table mysql.general_log add index(thread_id)"

> mysql -uuser -ppassword -e"set global general_log='ON'"

## After allowing time for the queries to be logged, parse the log into per-thread, timed query playbooks, with a scheduler.lua file too.

> ./convert.lua

## Feed the scheduler.lua and the [thread].lua files to sysbench.

