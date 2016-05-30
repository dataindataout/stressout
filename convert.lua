#!/usr/local/bin/lua

-- Script to convert MySQL general log
-- into a replayable, timed list of queries

-- This is also my lua hello world :)

-- Valerie Parham-Thompson for sharing 2016
-- keep it open and free

-- TODO: error handling
-- TODO: cross-platform testing

-- #################################################################################

-- Open a MySQL connection using parameters passed into script

mysql = require "luasql.mysql"
date = require "date"

local env  = mysql.mysql()
local conn = env:connect('mysql','valerie','password','192.168.1.234')

-- Capture current starting and ending position

cursor_capture_times,errorString = conn:execute("select min(event_time) as capture_start_time, max(event_time) as capture_end_time from mysql.general_log")

row_capture_times = cursor_capture_times:fetch ({}, "start")

while row_capture_times do
   capture_start_time = row_capture_times.capture_start_time
   capture_end_time = row_capture_times.capture_end_time
   row_capture_times = cursor_capture_times:fetch (row_capture_times, "start")
end

cursor_capture_times:close()

-- Loop through thread IDs within the starting and ending position

cursor_threads,errorString = conn:execute("select thread_id, event_time from mysql.general_log where command_type='Connect' and event_time>'" .. capture_start_time .. "'and event_time<'" .. capture_end_time .. "'")

row_threads = cursor_threads:fetch ({}, "threads")

while row_threads do

   local current_thread_id = row_threads.thread_id
   local current_thread_start_time = row_threads.event_time

    -- open the main scheduler file
    scheduler_file = io.open("scheduler.lua", "a")
   io.output(scheduler_file)

   io.write("-- ================\n")
   io.write(current_thread_id .. ".lua\n")
   thread_start_offset = date.diff(current_thread_start_time,capture_start_time):spanseconds()
   io.write(thread_start_offset .. "\n")
   io.write("-- " .. current_thread_start_time .. "\n")
   
   io.close(scheduler_file)

   -- open individual thread files
   thread_file = io.open(current_thread_id .. ".lua", "a")
   io.output(thread_file)

   io.write("-- ================\n")
   io.write("-- Thread ID: " .. current_thread_id .. "\n")
   io.write("-- Thread Start Time: " .. current_thread_start_time .. "\n")
   io.write("-- ================\n")

       cursor_thread_details,errorString = conn:execute("select event_time, argument from mysql.general_log where command_type='Query' and thread_id='" .. current_thread_id .. "'")

       row_thread_details = cursor_thread_details:fetch ({}, "thread_details")

       -- initialize
       last_thread_detail_start_time = current_thread_start_time

       while row_thread_details do

          thread_detail_start_time = row_thread_details.event_time
          io.write("-- Query Start Time: " .. thread_detail_start_time .. "\n")
          -- io.write("-- Last Start Time : " .. last_thread_detail_start_time .. "\n")

          local thread_detail_start_offset = date.diff(thread_detail_start_time,last_thread_detail_start_time):spanseconds()
          local thread_detail_query = row_thread_details.argument
          
          -- this will be a function calling os.execute("sleep " .. tonumber(n))
          io.write("sleep(" .. thread_detail_start_offset .. ")\n")
          io.write("rs = db_query('" .. thread_detail_query .. "')\n")

          io.write("-- ================\n")

          last_thread_detail_start_time = thread_detail_start_time

          row_thread_details = cursor_thread_details:fetch (row_thread_details, "thread_details")
       end

       cursor_thread_details:close()

   row_threads = cursor_threads:fetch (row_threads, "threads")

   io.close(thread_file)

end

-- close all
cursor_threads:close()

conn:close()
env:close()