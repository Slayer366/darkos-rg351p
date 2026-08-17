#!/bin/bash
clear

UPDATE_DATE="08172026"
LOG_FILE="/home/ark/update$UPDATE_DATE.log"
UPDATE_DONE="/home/ark/.config/.update$UPDATE_DATE"

if [ -f "$UPDATE_DONE" ]; then
  msgbox "No more updates available.  Check back later."
  rm -- "$0"
  exit 187
fi

if [ -f "$LOG_FILE" ]; then
  sudo rm "$LOG_FILE"
fi

c_brightness="$(cat /sys/devices/platform/backlight/backlight/backlight/brightness)"
sudo chmod 666 /dev/tty1
echo 255 > /sys/devices/platform/backlight/backlight/backlight/brightness
touch $LOG_FILE
tail -f $LOG_FILE >> /dev/tty1 &


if [ ! -f "/home/ark/.config/.update08052026" ]; then

  printf "\nInitial update test \n" | tee -a "$LOG_FILE"
#  sudo wget --no-check-certificate https://github.com/slayer366/darkos-rg351p/raw/main/08052026/darkosupdate08052026.zip -O /home/ark/darkosupdate08052026.zip -a "$LOG_FILE" || rm -f /home/ark/darkosupdate08052026.zip | tee -a "$LOG_FILE"
#  if [ -f "/home/ark/darkosupdate08052026.zip" ]; then
#    sudo unzip -X -o /home/ark/darkosupdate08052026.zip -d / | tee -a "$LOG_FILE"
#    sudo rm -v /home/ark/darkosupdate08052026.zip | tee -a "$LOG_FILE"
#  else
#    printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
#    sleep 3
#    echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
#    exit 1
#  fi


      sudo chown -R ark:ark /opt/

    printf "\nMake sure permissions for the ark home directory are set to 755\n" | tee -a "$LOG_FILE"
      sudo chown -R ark:ark /home/ark
      sudo chmod -R 755 /home/ark

    sudo rm -rf /dev/shm/*

    printf "\n Set permissions on es_systems.cfg in case they were altered \n" | tee -a "$LOG_FILE"
      sudo chmod ugo+rwx /etc/emulationstation/es_systems.cfg

    printf "\n Ensure proper permissions are set for system launch scripts and asoundfix \n" | tee -a "$LOG_FILE"
      sudo chmod 777 /opt/system/Advanced/*.sh
      sudo chmod ugo+rw /opt/system/Advanced/asoundfix.zip

    printf "\nEnsure 64bit and 32bit SDL2 are still properly linked\n" | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2.so /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.3200.10 /usr/lib/aarch64-linux-gnu/libSDL2.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2.so /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.3200.10 /usr/lib/arm-linux-gnueabihf/libSDL2.so | tee -a "$LOG_FILE"

  touch "/home/ark/.config/.update08052026"

fi


if [ ! -f "/home/ark/.config/.update08102026" ]; then

  printf "\nFix duckstation-standalone \n" | tee -a "$LOG_FILE"
  sudo rm -rf /dev/shm/*
  sudo wget --no-check-certificate https://github.com/slayer366/darkos-rg351p/raw/main/08102026/darkosupdate08102026.zip -O /home/ark/darkosupdate08102026.zip -a "$LOG_FILE" || rm -f /home/ark/darkosupdate08102026.zip | tee -a "$LOG_FILE"
  if [ -f "/home/ark/darkosupdate08102026.zip" ]; then
    sudo unzip -X -o /home/ark/darkosupdate08102026.zip -d / | tee -a "$LOG_FILE"
    sudo rm -v /home/ark/darkosupdate08102026.zip | tee -a "$LOG_FILE"
  else
    printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
    sleep 3
    echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
    exit 1
  fi


      sudo chown -R ark:ark /opt/

    printf "\nMake sure permissions for the ark home directory are set to 755\n" | tee -a "$LOG_FILE"
      sudo chown -R ark:ark /home/ark
      sudo chmod -R 755 /home/ark

    printf "\nRemove incompatible build of duckstation-standalone (also saves ~60MB)\n" | tee -a "$LOG_FILE"
      sudo rm -fv /opt/duckstation/duckstationsa
      sudo rm -fv /usr/local/bin/psx.sh

    printf "\nEnsure proper permissions are set for duckstation-nogui and its resources\n" | tee -a "$LOG_FILE"
      sudo chmod 666 /opt/duckstation/duckstation_cmd_line_opts.txt
      sudo chmod 775 /opt/duckstation/resources/gamecontrollerdb.txt
      sudo chmod 777 /usr/local/bin/standalone-duckstation
      sudo chmod 775 -R /opt/duckstation/conf/duckstation/*
      sudo chmod 777 /opt/duckstation/duckstation-nogui

    printf "\n Set permissions on es_systems.cfg in case they were altered \n" | tee -a "$LOG_FILE"
      sudo chmod ugo+rwx /etc/emulationstation/es_systems.cfg

    printf "\nEnsure 64bit and 32bit SDL2 are still properly linked\n" | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2.so /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.3200.10 /usr/lib/aarch64-linux-gnu/libSDL2.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2.so /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.3200.10 /usr/lib/arm-linux-gnueabihf/libSDL2.so | tee -a "$LOG_FILE"

  touch "/home/ark/.config/.update08102026"

fi


if [ ! -f "/home/ark/.config/.update08172026" ]; then

  printf "\nFix standalone-2022 emulator for atomiswave and naomi \n" | tee -a "$LOG_FILE"
  sudo rm -rf /dev/shm/*
  sudo wget --no-check-certificate https://github.com/slayer366/darkos-rg351p/raw/main/08172026/darkosupdate08172026.zip -O /home/ark/darkosupdate08172026.zip -a "$LOG_FILE" || rm -f /home/ark/darkosupdate08172026.zip | tee -a "$LOG_FILE"
  if [ -f "/home/ark/darkosupdate08172026.zip" ]; then
    sudo unzip -X -o /home/ark/darkosupdate08172026.zip -d / | tee -a "$LOG_FILE"
    sudo rm -v /home/ark/darkosupdate08172026.zip | tee -a "$LOG_FILE"
  else
    printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
    sleep 3
    echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
    exit 1
  fi


      sudo chown -R ark:ark /opt/

    printf "\nMake sure permissions for the ark home directory are set to 755\n" | tee -a "$LOG_FILE"
      sudo chown -R ark:ark /home/ark
      sudo chmod -R 755 /home/ark

    printf "\nEnsure proper permissions are set for naomi.sh and atomiswave.sh \n" | tee -a "$LOG_FILE"
      sudo chmod 777 /usr/local/bin/atomiswave.sh
      sudo chmod 777 /usr/local/bin/naomi.sh

    printf "\nMove ES backups into subfolder \n" | tee -a "$LOG_FILE"
      sudo mkdir -p /etc/emulationstation/bak
      sudo mv -f -v /etc/emulationstation/es_dc_backup.txt /etc/emulationstation/bak/es_dreamcast.bak
      sudo mv -f -v /etc/emulationstation/es_saturn_bak.txt /etc/emulationstation/bak/es_saturn.bak
      sudo mv -f -v /etc/emulationstation/es_naomi_bak.txt /etc/emulationstation/bak/es_naomi.bak
      sudo mv -f -v /etc/emulationstation/es_systems.ark /etc/emulationstation/bak/es_systems.ark
      sudo mv -f -v /etc/emulationstation/es_systems.old /etc/emulationstation/bak/es_systems.old
      sudo mv -f -v /etc/emulationstation/es_systems.cfg.dual /etc/emulationstation/bak/es_systems.cfg.dual

      sudo chmod 666 /etc/emulationstation/bak/*

    printf "\n Set permissions on es_systems.cfg in case they were altered \n" | tee -a "$LOG_FILE"
      sudo chmod ugo+rwx /etc/emulationstation/es_systems.cfg

    printf "\nEnsure 64bit and 32bit SDL2 are still properly linked\n" | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2.so /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.3200.10 /usr/lib/aarch64-linux-gnu/libSDL2.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2.so /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.3200.10 /usr/lib/arm-linux-gnueabihf/libSDL2.so | tee -a "$LOG_FILE"

  touch "/home/ark/.config/.update08172026"

fi


if [ ! -f "$UPDATE_DONE-1" ]; then


  printf "\nEnsure 64bit and 32bit sdl2 is still properly linked\n" | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2.so /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.3200.10 /usr/lib/aarch64-linux-gnu/libSDL2.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2.so /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so | tee -a "$LOG_FILE"
      sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.3200.10 /usr/lib/arm-linux-gnueabihf/libSDL2.so | tee -a "$LOG_FILE"

  printf "\nUpdate boot text to reflect final current version of ArkOS for the 351 P/M \n" | tee -a "$LOG_FILE"
  sudo sed -i "/title\=/c\title\=dArkOS RG351P/M Slayer366 ($UPDATE_DATE)" /usr/share/plymouth/themes/text.plymouth
  echo "$UPDATE_DATE" > /home/ark/.config/.VERSION

  touch "$UPDATE_DONE"
  sudo chmod 766 "/home/ark/.config/.update*"
  sudo rm -rf /dev/shm/*
  rm -v -- "$0" | tee -a "$LOG_FILE"
  printf "\033c" >> /dev/tty1
  msgbox "Updates have been completed.  System will now restart after you hit the A button to continue.  If the system doesn't restart after pressing A, just restart the system manually."
  echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
  sudo reboot
  exit 187

fi
