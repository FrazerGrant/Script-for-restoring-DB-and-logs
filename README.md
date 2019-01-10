# Script-for-restoring-DB-and-logs
script for restoring a SQL database and all of the transactional log files that go with it.  Very useful when there is a log created every 30 minutes.
The SQL management console will not allow you to select more than a small number of log files at one time.

The script opens a windows dialog box, select to the full backup and it will create a script restoring all the log files in correct order.

Note make sure the full back up and log files are in the same folder.
