@echo off
echo Uninstalling all versions of Python...
timeout /t 10 > nul
echo Hope you're ready loser...only one more step until you are MINE

:: Uninstall Python 2.7
echo Uninstalling Python 2.7...
wmic product where "name like 'Python 2%%'" call uninstall /nointeractive
echo Python 2.7 has been uninstalled.

:: Uninstall Python 3.x
echo Uninstalling Python 3.x...
wmic product where "name like 'Python 3%%'" call uninstall /nointeractive
echo All versions of Python 3.x have been uninstalled.

echo All versions of Python have been uninstalled.

:: Open Microsoft Store page for Python 3.11
echo Opening Microsoft Store page for Python 3.11...
start https://www.microsoft.com/store/apps/9NRWMJP3717K

pause