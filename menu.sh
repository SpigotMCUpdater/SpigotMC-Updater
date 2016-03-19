#!/bin/bash

@echo off

@echo This build is in beta and could break important files. Continue: 
Set /P _1=(Y, N) || Set _1=NothingChosen
If "%_1%"=="NothingChosen" goto :start
If /i "%_1%"=="Y" goto start
If /i "%_1%"=="y" goto start
If /i "%_1%"=="N" goto stop
If /i "%_1%"=="n" goto stop

:start
if exist config/ (@echo config folder exists) else (@echo config folder not found. Generating Directory...
md config)

if exist config/version.txt (@echo version.txt was found) else (@echo version.txt is missing. Creating config option...
curl -o config/version.txt http://thegearmc.com/update/version.txt
)

if exist files/ (@echo Directory files was found) else (@echo Directory files doesn't exist. Generating directory...
md files
)

:stop
@echo Thanks for using SpigotMC updater by SpigotMCUpdater
@echo Contributors: Legoman99573, qlimax5000, and NatoBoram
@pause
exit
