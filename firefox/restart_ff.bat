@echo off
:loop
cls
taskkill /F /IM Firefox.exe
cls
taskkill /F /IM crashreporter.exe
cls
taskkill /F /IM plugin-container.exe
start "" "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" -no-remote
timeout 3600 /NOBREAK
goto loop
