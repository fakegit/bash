@echo off
:loop
start "" "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
timeout 3600 /NOBREAK
cls
taskkill /F /IM Firefox.exe
cls
taskkill /F /IM crashreporter.exe
cls
taskkill /F /IM plugin-container.exe
goto loop
