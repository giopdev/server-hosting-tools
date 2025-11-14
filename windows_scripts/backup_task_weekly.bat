@echo off
setlocal enabledelayedexpansion

set "sourceFolder=C:\servers\ark_server\ShooterGame\Saved\SavedArks\TheIsland_WP"
set "destinationRoot=C:\servers\server_backups\weekly"
set "backupCount=4"

set "timestamp=%date:~-4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%"
set "destinationFolder=%destinationRoot%\Backup_%timestamp%"

xcopy "%sourceFolder%" "%destinationFolder%" /E /Y /I

rem Cleanup old backups
for /f "skip=%backupCount% delims=" %%d in ('dir /AD /B /O-N "%destinationRoot%\Backup_*"') do rd /S /Q "%destinationRoot%\%%d"
