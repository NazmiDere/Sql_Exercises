@Echo Off
ECHO Preparing the lab environment...

REM - Get current directory
SET SUBDIR=%~dp0

REM - Restart SQL Server Service to force closure of any open connections
NET STOP SQLSERVERAGENT
NET STOP SQLPBDMS
NET STOP SQLPBENGINE
NET STOP MSSQLLaunchpad
NET STOP MSSQLSERVER
NET START MSSQLSERVER
NET START SQLPBDMS
NET START SQLPBENGINE
NET START MSSQLLaunchpad
NET START SQLSERVERAGENT

REM - Run SQL Script to prepare the database environment
ECHO Preparing Databases...
SQLCMD -E -i %SUBDIR%SetupFiles\Setup.sql



