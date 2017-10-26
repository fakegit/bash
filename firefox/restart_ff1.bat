@echo off
start "" "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
:loop
tasklist /nh /fi "imagename eq firefox.exe" /fi "status eq running` |find  /i "firefox.exe"  >nul && ( 
timeout 3600 /NOBREAK
) || ( 
cls
taskkill /F /IM Firefox.exe
cls
taskkill /F /IM crashreporter.exe
timeout 4 /NOBREAK
set MOZ_NO_REMOTE=1
start "" "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
set MOZ_NO_REMOTE=
)
goto loop
