# Raspberry Pi MC Server Setup

## 1. Install Raspbian

- Using the Raspberry Pi Imager, install Raspbian

- Select Pi Model, Select Raspbian 64bit lite, select your SD Card

- Select 'Enable SSH'

- Write

## 2. Download Requirements

- Download [Paper](https://papermc.io/downloads/paper) and store it in this project directory.
- Download the required version of [Java](https://www.oracle.com/java/technologies/javase/jdk21-archive-downloads.html) (likely 21)
- Download any other plugins you want

## 3. Install Programs

Connect to Pi and install programs with:
```
$ ssh user@hostname
$ sudo apt update
$ sudo apt install tmux vim
$ sudo tar -xzf [java tar]
$ sudo mv [java folder] /opt
$ sudo update-alternatives --install /usr/bin/java java /opt/[java folder]/bin/java 1
(Select option 1)
$ sudo update-alternatives --config java
$ exit
```

## 4. Move files and setup
Connect to Pi and setup with:
```
$ sftp user@hostname
$ put files/.bash_aliases .
$ put files/.server_commands.txt .
$ put [paper file] server
$ echo "cat .server_commands.txt" >> .bashrc
$ exit
```

## 5. Port forward
- Open ports 25565 (Minecraft) and 22 (SSH)
- Setup domain name, I use [NoIp](https://www.noip.com/)