@echo off
if "%1" == "" GOTO :ERR
if "%2" == "" (set LNUM=5) else (set /a LNUM=%2)

echo.
echo   ** head start ** type head %LNUM% lines **
setlocal enabledelayedexpansion
for /f "tokens=1,2,3 usebackq" %%i in (`find /v /c "" %1`) do set LCTR=%%k

set /a CTR=0

for /f "tokens=1* delims=:" %%i in ('findstr /n "^" %1') do (
if "!CTR!" == "%LNUM%" goto :ENDX
if "%%j" == "" (echo. ) else (echo %%j)
set /a CTR+=1
)

:ENDX
echo   ** head end **
echo   ** cf : %1 has %LCTR% lines.
echo.
exit /b

:ERR
exit /b
