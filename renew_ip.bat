@echo off
:: Run the script as administrator
NET SESSION >nul 2>&1
if %errorLevel% == 0 (
    goto gotPrivileges
) else (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\admin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\admin.vbs"
    "%temp%\admin.vbs"
    exit /B
)
:gotPrivileges

:: Run ipconfig commands
ipconfig /release
ipconfig /renew
