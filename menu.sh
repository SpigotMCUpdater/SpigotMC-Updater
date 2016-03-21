#!/bin/bash

START_DIR=$(pwd)

function drawMenu {
 if [ $1 = "main" ]
 then
  clear
  echo "Main Menu: "
  echo "    [1] Update BuildTools"
  echo "    [2] Update BungeeCord"
  echo "    [3] Update Spigot"
  echo "    [4] "
  echo "    [5] "
  echo "    [6] "
  echo "    [7] "
  echo "    [8] "
  echo "    [9] Exit"
  echo -n "Option > "
  read option
  if [ $option = "1" ]
  then
   clear
   echo "Downloading the latest BuildTools..."
   curl -O --progress-bar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
   if [ $? -ne 0 ]
   then
    pause Download failed. Press enter to return to the main menu
   fi
   drawMenu main
  elif [ $option = "2" ]
  then
   clear
   echo "Downloading the latest BungeeCord..."
   curl -O --progress-bar http://ci.md-5.net/job/bungeecord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
   if [ $? -ne 0 ]
   then
    pause Download failed. Press enter to return to the main menu
   fi
   drawMenu main
  elif [ $option = "9" ]
  then
   exit
  else
   drawMenu main
  fi
 fi
}

function pause {
   read -p "$*"
}

drawMenu main
sleep 3
