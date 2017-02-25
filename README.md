# stressout
Stressing out your database.

todo:
<li>error handling</li>
<li>cross-platform testing</li>
<li>handling writes</li>
<li>sysbench scheduling using scheduler.lua</li>

## Install dependencies

Install lua:
> yum install lua

Install luarocks:
> https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix

Install the luasql-mysql and date modules:
> luarocks install luasql-mysql MYSQL_DIR=/var/lib/mysql MYSQL_INCDIR=/usr/include/mysql

> luarocks install date

## Enable the general log in MySQL

> mysql -uuser -ppassword < myisam_log.sql

## After allowing time for the queries to be logged, parse the log into per-thread, timed query playbooks, with a scheduler.lua file too.

> ./convert.lua

## Feed the scheduler.lua and the [thread].lua files to sysbench.

