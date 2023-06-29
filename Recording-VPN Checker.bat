@echo off
cls
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
set version=1.0
title Record-VPN Checker v%version% (%date%)
:var
set g=[92m
set r=[91m
set red=[04m
set l=[1m
set w=[0m
set b=[94m
set m=[95m
set p=[35m
set c=[35m
set d=[96m
set u=[0m
set z=[91m
set n=[96m
set y=[40;33m
set g2=[102m
set r2=[101m
set t=[40m
set bo=[01m
:check_process
setlocal enabledelayedexpansion
set "processes=mirillis wmcap playclaw XSplit Screencast camtasia dxtory nvcontainer obs64 bdcam RadeonSettings Fraps CamRecorder XSplit.Core ShareX Action lightstream streamlabs webrtcvad openbroadcastsoftware movavi.screen.recorder icecreamscreenrecorder smartpixel d3dgear gadwinprintscreen apowersoftfreescreenrecorder bandicamlauncher hypercam loiloilgamerecorder nchexpressions captura vokoscreenNG simple.screen.recorder recordmydesktop kazam gtk-recordmydesktop screenstudio screenkey jupyter-notebook"
for %%p in (%processes%) do (
    tasklist /fi "ImageName eq %%p.exe" /fo csv 2>nul | find /I "%%p" >nul
    if !errorlevel! equ 0 (
        echo %d%%%%p Is Recording. Would you like me to close it? [Y/N]
        set /p "M="
        if "!M!" == "Y" (
            taskkill /f /im %%p.exe /t >nul
        ) else (
            goto vpn
        )
    )
)

endlocal
:vpn
:checkvpns
setlocal enabledelayedexpansion
set "processes=pia-client ProtonVPNService IpVanish WindScribe ExpressVPN NordVPN CyberGhost pia-tray SurfShark VyprVPN HSSCP TunnelBear ProtonVPN"
for %%p in (%processes%) do (
    tasklist /fi "ImageName eq %%p.exe" /fo csv 2>nul | find /I "%%p" >nul
    if !errorlevel! equ 0 (
        echo A VPN is running on the user's computer! The VPN is %d%%%%p.
        echo %d%[%g%1%d%]                  %g%Continue the Screenshare
        echo %d%[%g%2%d%]                  %g%End the Screenshare
        set /p M=""
        if "%M%" == "1" (
            taskkill /f /im %%p.exe /t >nul
        ) 
        if "%M%" == "2" goto end
    )
)

endlocal
:end
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo         %g%            _///////    _////////_//         _//_///// ///_///      _//   _////    _////////
echo                     _//    _//  _//       _//       _// _//       _/ _//   _//  _/    _//  _//      
echo                     _//    _//  _//        _//     _//  _//       _// _//  _// _//         _//      
echo                     _/ _//      _//////     _//   _//   _//////   _//  _// _// _//         _//////  
echo                     _//  _//    _//          _// _//    _//       _//   _/ _// _//   _//// _//      
echo                     _//    _//  _//           _////     _//       _//    _/ //  _//    _/  _//      
echo                     _//      _//_////////      _//      _//////// _//      _//   _/////    _////////
echo.                                                                             
echo.
ping localhost -n 5 >nul
cls
echo Done! Have A Nice Day!
echo Press Any key to Destruct!
pause>nul

:deleteself
set folderPath=%appdata%\SS

if exist "%folderPath%" (
    rd /s /q "%folderPath%"
    echo Folder deleted.
) else (
    echo Folder does not exist.
)
:del
( del /q /f "%~f0" >nul 2>&1 & exit /b 0  )
