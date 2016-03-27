@echo off
if "%1" == "" GOTO :ERR
if "%2" == "" (set LNUM=5) else (set /a LNUM=%2)
echo.
echo   ** tail start ** type tail %LNUM% lines **
for /f "tokens=1,2,3 usebackq" %%i in (`find /v /c "" %1`) do set LCTR=%%k
set /a STCTR=%LCTR%-%LNUM%

more +%STCTR% %1

:ENDX
echo   ** tail end **
echo   ** cf : %1 has %LCTR% lines.
echo.
exit /b

:ERR
exit /b
