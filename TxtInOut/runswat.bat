@echo off
REM script to run swat in TxtInOut directory
REM parameter is path of swat executable (with quotes around it if any spaces)
REM only exits immediately if swat succeeds

REM run swat
%1

REM exit if OK
if %errorlevel% == 0 exit 0

REM waiting for input causes command window to remain visible
echo.
set /p x="SWAT run failed.  Hit Enter to exit"
exit 1

