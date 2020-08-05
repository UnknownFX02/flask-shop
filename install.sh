#!/bin/bash
declare -A osInfo;
osInfo[/etc/redhat-release]="yum install -y"
osInfo[/etc/arch-release]="pacman -S"
osInfo[/etc/fedora-release]="dnf install -y"
osInfo[/etc/debian_version]="apt-get install -y"
osInfo[/etc/alpine-release]="apk --update add"
osInfo[/etc/centos-release]="yum install -y"
osInfo[/etc/gentoo-release]="emerge -1"
osInfo[/etc/SuSE-release]="zypper install"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done

package="git docker docker-compouse"
echo "Install ${package}"
sudo ${package_manager} ${package}
echo "Clone repository"
git clone https://github.com/UnknownFX02/flask-shop ~/flask-shop
echo "Start docker service"
sudo systemctl start docker
echo "Wating docker service start"
sleep 1m
echo "Deploy docker"
cd ~/flask-shop && docker-compose up -d
