# stressout
Stressing out your database.

todo:
<li>error handling</li>
<li>cross-platform testing</li>
<li>handling writes</li>
<li>sysbench scheduling using scheduler.lua</li>

This of course doesn't have to be written in lua to create lua files. I just wanted to use lua.

## Install dependencies

You need the mysql client if you're running this on a remote machine. Here's one way to get that on Mac:
> brew install mariadb

Install lua (luarocks will come with it) and the luasql-mysql and date modules:
> brew install lua

> luarocks install luasql-mysql MYSQL_DIR=/usr/local/bin MYSQL_INCDIR=/usr/local/Cellar/mariadb/10.1.21/include/mysql

> luarocks install date

## Enable the general log in MySQL

> mysql -uuser -ppassword < myisam_log.sql

## After allowing time for the queries to be logged, parse the log into per-thread, timed query playbooks, with a scheduler.lua file too.

> ./convert.lua

## Feed the scheduler.lua and the [thread].lua files to sysbench.

