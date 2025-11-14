@echo off
echo ###############################
echo Updating server...
echo ###############################
steamcmd\steamcmd.exe +force_install_dir ..\ark_server\ +login anonymous +app_update 2430930 validate +quit

echo ###########################
echo Starting server...
echo ###########################
start ark_server\ShooterGame\Binaries\Win64\ArkAscendedServer.exe TheIsland_WP -NoBattlEye
