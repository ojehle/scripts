#!/bin/bash

cd /volume1/@ActiveBackup-Office365/db
sqlite3 log.sqlite <<_EOF
PRAGMA journal_mode=WAL;
begin transaction;
delete from job_log_table where timestamp < strftime('%s',datetime('now', '-30 days'));
delete from global_log_table where row_id in (select row_id from global_log_table g where g.task_execution_id > 0 and not exists (select 1 from job_log_table j where j.job_execution_id = g.task_execution_id ));
commit;
.quit
_EOF
