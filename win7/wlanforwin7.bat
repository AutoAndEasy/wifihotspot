@echo off
rem The Scripts can share your network to wireless,and make your win7 to a wifi device.

goto about

:about
cls
echo ***************************************************
echo *                                                 *
echo *             WiFi Share For Win7  V1.0           *
echo *	        author:翅儿学飞                   *
echo *           2013-02-03 ; QingDao of China         * 
echo *                                                 *
echo ***************************************************
echo.   
echo Warning:This script should be run by administrator!
echo.
echo 警告：此程序需要使用管理员权限运行!
echo.
echo.
echo.
timeout 10
goto menu

:menu
cls
echo ============    MEMU    ============
echo 1:Create or Change a wireless network
echo 2:Start the wireless network
echo 3:Stop the wireless network
echo 4:Show the status of the wireless network
echo 9:About this program
echo 0:Exit (default choice after 30seconds)
echo.
choice -T 30 /C 123490 -D 0 /M "Please Input Your Choice:"

if errorlevel 6 goto exit
if errorlevel 5 goto about
if errorlevel 4 goto shownet
if errorlevel 3 goto stopnet
if errorlevel 2 goto startnet
if errorlevel 1 goto createnet

:createnet
set /p userssid=Please Input Your Wireless SSID:
set /p userpwd=Please Input Your Wireless Password:
netsh wlan set hostednetwork mode=allow ssid=%userssid% key=%userpwd%
timeout 3 > nul
goto menu

:startnet
netsh wlan start hostednetwork
timeout 3 > nul
goto menu

:stopnet
netsh wlan stop hostednetwork
timeout 3 > nul
goto menu

:shownet
netsh wlan show hostednetwork
timeout 30
goto menu

:exit
cls
echo ***************************************************
echo *
echo *程序作者:翅儿学飞
echo *友情联系:myregs@126.com
echo *版权说明:此程序遵守GPL许可。可以任意使用，修改，发布！
echo *
echo ***************************************************
echo.
echo                                   Thank you !
echo.
echo.
echo                                    Byebye :)
timeout 2 > nul
exit