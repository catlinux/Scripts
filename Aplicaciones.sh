#!/bin/bash

printf "\e[8;30;100;t" && clear

## Variables
CABEZERA1="####################################################################"
CABEZERA2="##                                                                ##"
CABEZERA3="## Script para instalar aplicaciones automáticamente en Archlinux ##"
MENU_ALMO="##############################"
MENU_PRPL="##      Menú principal      ##"
MENU_ACCS="##    Menú de Accesorios    ##"
MENU_INET="##      Menú Internet       ##"
MENU_OFMT="##    Menú de Ofimática     ##"
MENU_MULT="##     Menú Multimedia      ##"
MENU_DESC="##     Menú de Descargas    ##"
MENU_GRFC="##  Menú Gráficos e Imagen  ##"
MENU_VARI="##   Menú programas varios  ##"
ROJO='\e[0;31m'
AZUL='\e[0;34m'
VERDE='\e[0;32m'
NARANJA='\e[0;33m'
NC='\e[0m'
WPS="WPS Kingsoft office"
LIBRE="Libre Office"
EOG="Eye of Gnome"
NTFS="ntfs-3g"

printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
printf "${AZUL} %*s\n" $(((${#CABEZERA2}+100)/2)) "$CABEZERA2"
printf "${AZUL} %*s\n" $(((${#CABEZERA3}+102)/2)) "$CABEZERA3"
printf "${AZUL} %*s\n" $(((${#CABEZERA2}+100)/2)) "$CABEZERA2"
printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
echo -e "${NC}"
sleep 2 && clear

function accesorios
{
	accesorios=""
	while [ "$accesorios" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_ACCS}+102)/2)) "$MENU_ACCS"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- gnome-system-momitor\(EOG\) - visor de imágenes
		echo 2- VirtualBox - Instalar máquinas virtuales
		echo 3- gedit - Editor de texto
		echo 4- unetbootin - Graba iso\'s en tu pendrive
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " accesorios 
		clear   
		if [ "$accesorios" = "1" ]; then
			sudo pacman -Sy --noconfirm gnome-system-monitor && clear
			if [ -x /usr/bin/gnome-system-monitor  ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((gnome-system-monitor+100)/2)) "gnome-system-monitor"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((gnome-system-monitor+100)/2)) "gnome-system-monitor"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$accesorios" = "2" ]; then
			sudo pacman -Sy --noconfirm virtualbox virtualbox-guest-iso net-tools
			sudo gpasswd -a $USER vboxusers && sudo modprobe vboxdrv && sudo depmod -a
			echo vboxdrv | sudo tee -a /etc/modules-load.d/virtualbox.conf
			echo vboxnetadp | sudo tee -a /etc/modules-load.d/virtualbox.conf
			echo vboxnetflt | sudo tee -a /etc/modules-load.d/virtualbox.conf
			echo vboxpci | sudo tee -a /etc/modules-load.d/virtualbox.conf
			clear
			if [ -x /usr/bin/virtualbox ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Virtualbox+100)/2)) "Virtualbox"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Virtualbox+100)/2)) "Virtualbox"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$accesorios" = "3" ]; then
			sudo pacman -Sy --noconfirm gedit && clear
			if [ -x /usr/bin/gedit ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((gedit+100)/2)) "gedit"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((gedit+100)/2)) "gedit"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$accesorios" = "4" ]; then
			sudo pacman -Sy --noconfirm unetbootin && clear
			if [ -x /usr/bin/unetbootin ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((unetbootin+100)/2)) "unetbootin"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((unetbootin+100)/2)) "unetbootin"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$accesorios" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function internet
{
	internet=""
	while [ "$internet" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_INET}+102)/2)) "$MENU_INET"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Firefox - Navegador de Mozilla
		echo 2- Chrome - Navegador de coódigo abierto de Google
		echo 3- Chromium - Navegador software libre de Google
		echo 4- Filezilla - Cliente FTP
		echo 5- Flashplugins - Plugin para ver videos y animaciones en el navegador
		echo 6- Skype - Software que permite comunicaciones de texto, voz y vídeo sobre Internet
		echo 7- Thunderbird - Cliente de correo de Mozilla
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " internet 
		clear
		if [ "$internet" = "1" ]; then
			sudo pacman -Sy --noconfirm firefox-i18n-es-es && clear
			if [ -x /usr/bin/firefox ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Firefox+100)/2)) "Firefox"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Firefox+100)/2)) "Firefox"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$internet" = "2" ]; then
			yaourt -Sy --noconfirm google-chrome && clear
			if [ -x /usr/bin/google-chrome-stable ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Chrome+100)/2)) "Chrome"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Chrome+100)/2)) "Chrome"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$internet" = "3" ]; then
			sudo pacman -Sy --noconfirm chromium && clear
			if [ -x /usr/bin/chromium ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Chromium+100)/2)) "Chromium"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Chromium+100)/2)) "Chromium"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$internet" = "4" ]; then
			sudo pacman -Sy --noconfirm filezilla && clear
			if [ -x /usr/bin/filezilla ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Filezilla+100)/2)) "Filezilla"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Filezilla+100)/2)) "Filezilla"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$internet" = "5" ]; then
			sudo pacman -Sy --noconfirm flashplugin && clear
			if [ -x /usr/bin/flash-player-properties ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Flashplugins+100)/2)) "Flashplugins"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Flashplugins+100)/2)) "Flashplugins"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$internet" = "6" ]; then
			sudo pacman -Sy --noconfirm skype && clear
			if [ -x /usr/bin/skype ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Skype+100)/2)) "Skype"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Skype+100)/2)) "Skype"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$internet" = "7" ]; then
			sudo pacman -Sy --noconfirm thunderbird-i18n-es-es && clear
			if [ -x /usr/bin/thunderbird ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Thunderbird+100)/2)) "Thunderbird"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Thunderbird+100)/2)) "Thunderbird"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$internet" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function ofimatica
{
	ofimatica=""
	while [ "$ofimatica" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_OFMT}+104)/2)) "$MENU_OFMT"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- WPS Kingsoft Office - Paquete de ofimática muy bueno
		echo 2- Libre Office - Paquete de ofimática muy completo y libre
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " ofimatica 
		clear
		if [ "$ofimatica" = "1" ]; then
			yaourt -Sy --noconfirm wps-office wps-office-es && clear
			if [ -x /usr/bin/wps ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((${#WPS}+100)/2)) "$WPS"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((${#WPS})/2)) "$WPS"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$ofimatica" = "2" ]; then
				sudo pacman -Sy --noconfirm libreoffice-es libreoffice-common libreoffice-calc libreoffice-writer libreoffice-base libreoffice-draw && clear
			if [ -x /usr/bin/wps ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((${#LIBRE}+100)/2)) "$LIBRE"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((${#LIBRE})/2)) "$LIBRE"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear

		elif [ "$ofimatica" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function multimedia
{
	multimedia=""
	while [ "$multimedia" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_MULT}+102)/2)) "$MENU_MULT"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Brasero - Grabador de \cd\'s y dvd\'s
		echo 2- K3b - Grabador de \cd\'s y dvd\'s basado en Kde muy recomendado
		echo 3- Radiotray - Para sintonizar emisoras de radio via internet
		echo 4- Vlc - Reproductor de video muy completo
		echo 5- SmPlayer - Otro buen reproductor de video
		echo 6- Clementine - Reproductor muy completo de audio
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " multimedia 
		clear
		if [ "$multimedia" = "1" ]; then
			sudo pacman -Sy --noconfirm brasero && clear
			if [ -x /usr/bin/brasero ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Brasero+100)/2)) "Brasero"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Brasero+100)/2)) "Brasero"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$multimedia" = "2" ]; then
				sudo pacman -Sy --noconfirm k3b && clear
			if [ -x /usr/bin/k3b ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((K3b+100)/2)) "K3b"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((K3b+100)/2)) "K3b"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$multimedia" = "3" ]; then
				yaourt -Sy --noconfirm radiotray 
				sudo pacman -S --noconfirm gstreamer0.10-{{bad,good,ugly,base}{,-plugins},ffmpeg} && clear
			if [ -x /usr/bin/radiotray ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Radiotray+100)/2)) "Radiotray"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Radiotray+100)/2)) "Radiotray"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$multimedia" = "4" ]; then
				sudo pacman -S --noconfirm vlc && clear
			if [ -x /usr/bin/vlc ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Vlc+100)/2)) "Vlc"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Vlc+100)/2)) "Vlc"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$multimedia" = "5" ]; then
				sudo pacman -S --noconfirm smplayer && clear
			if [ -x /usr/bin/smplayer ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((smplayer+100)/2)) "smplayer"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((smplayer+100)/2)) "smplayer"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$multimedia" = "6" ]; then
				sudo pacman -S clementine --noconfirm && clear
			if [ -x /usr/bin/clementine ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Clementine+100)/2)) "Clementine"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Clementine+100)/2)) "Clementine"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear

		elif [ "$multimedia" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function descargas
{
	descargas=""
	while [ "$descargas" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_DESC}+102)/2)) "$MENU_DESC"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Amule - Programa p2p basado en emule
		echo 2- Deluge - Cliente para archivos torrent
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " descargas 
		clear
		if [ "$descargas" = "1" ]; then
			sudo pacman -Sy --noconfirm amule && clear
			if [ -x /usr/bin/amule ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Amule+100)/2)) "Amule"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Amule+100)/2)) "Amule"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$descargas" = "2" ]; then
				sudo pacman -Sy --noconfirm deluge && clear
			if [ -x /usr/bin/deluge ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Deluge+100)/2)) "Deluge"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Deluge+100)/2)) "Deluge"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
			
		elif [ "$descargas" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function graficos
{
	graficos=""
	while [ "$graficos" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_GRFC}+104)/2)) "$MENU_GRFC"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Inkscape - Editor de imágenes vectorial
		echo 2- Gimp - Editor de imágenes
		echo 3- Evince - Para visualizar documentos PDF
		echo 4- eog - Visor de imágenes básico para gnome
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " graficos 
		clear
		if [ "$graficos" = "1" ]; then
			sudo pacman -Sy --noconfirm inkscape && clear
			if [ -x /usr/bin/inkscape ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Inkscape+100)/2)) "Inkscape"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Inkscape+100)/2)) "Inkscape"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$graficos" = "2" ]; then
				sudo pacman -Sy --noconfirm gimp && clear
			if [ -x /usr/bin/gimp ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Gimp+100)/2)) "Gimp"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Gimp+100)/2)) "Gimp"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$graficos" = "3" ]; then
				sudo pacman -Sy --noconfirm evince && clear
			if [ -x /usr/bin/evince ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Evince+100)/2)) "Evince"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Evince+100)/2)) "Evince"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$graficos" = "4" ]; then
				sudo pacman -Sy --noconfirm eog && clear
			if [ -x /usr/bin/eog ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((${#EOG}+100)/2)) "$EOG"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((${#EOG}+100)/2)) "$EOG"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
			
		elif [ "$graficos" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function varios
{
	varios=""
	while [ "$varios" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_VARI}+102)/2)) "$MENU_VARI"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Compresores - Selección de los compresores más comunes
		echo 2- Wine - Para poder ejecutar programas en windows
		echo 3- Playonlinux - Para poder ejecutar basados en windows
		echo 4- Gparted - Gestor de particiones y discos
		echo 5- jre7-openjdk - para correr programas en java
		echo 6- ntf3-3g - Para poder acceder a particiones ntfs con permisos de lectura y escritura
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " varios 
		clear
		if [ "$varios" = "1" ]; then
			sudo pacman -Sy --noconfirm arj bzip2 gzip lzop p7zip tar unrar unzip zip lrzip unace file-roller && clear
			if [ -x /usr/bin/bzip2 ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Compresores+100)/2)) "Compresores"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Compresores+100)/2)) "Compresores"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$varios" = "2" ]; then
				sudo pacman -Sy --noconfirm wine wine-mono wine_gecko winetricks && clear
			if [ -x /usr/bin/wine ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Wine+100)/2)) "Wine"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Wine+100)/2)) "Wine"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$varios" = "3" ]; then
				sudo pacman -Sy --noconfirm playonlinux && clear
			if [ -x /usr/bin/playonlinux ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Playonlinux+100)/2)) "Playonlinux"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Playonlinux+100)/2)) "Playonlinux"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$varios" = "4" ]; then
				sudo pacman -Sy --noconfirm gparted && clear
			if [ -x /usr/bin/gparted ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Gparted+100)/2)) "Gparted"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Gparted+100)/2)) "Gparted"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$varios" = "5" ]; then
				sudo pacman -Sy --noconfirm jre7-openjdk && clear
			if [ -x /usr/bin/java ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((JRE7+100)/2)) "JRE7"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((JRE7+100)/2)) "JRE7"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$varios" = "6" ]; then
				sudo pacman -Sy --noconfirm ntfs-3g && clear
			if [ -x /usr/bin/ntfs-3g ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((${#NTFS}+100)/2)) "$NTFS"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((${#NTFS}+100)/2)) "$NTFS"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "NO SE HA INSTALADO !!!"
				echo -e "${NC}"
			fi
			sleep 4 && clear
			
		elif [ "$varios" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function principal
{
	opt=""
	while [ "$opt" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_PRPL}+102)/2)) "$MENU_PRPL"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Instalación de repositorios AUR y yaourt
		echo 2- Accesorios
		echo 3- Internet
		echo 4- Ofimática
		echo 5- Multimedia
		echo 6- Descargas
		echo 7- Gráficos
		echo 8- Varios
		echo ""
		echo 0- Salir del script
		echo
		read -p "Selecciona una opción: " opt
		clear
		if [ "$opt" = "1" ]; then
			if [ ! -z $(grep "archlinuxfr" "/etc/pacman.conf") ]; then
   				sudo pacman -Sy --noconfirm yaourt && clear
			else (
				echo ""
				echo "[archlinuxfr]"
				echo "SigLevel = Never"
				echo "Server = http://repo.archlinux.fr/\$arch") | sudo tee -a /etc/pacman.conf >/dev/null
				sudo pacman -Sy --noconfirm yaourt && clear
			fi
		elif [ "$opt" = "2" ]; then
			accesorios
		elif [ "$opt" = "3" ]; then
			internet
		elif [ "$opt" = "4" ]; then
			ofimatica
		elif [ "$opt" = "5" ]; then
			multimedia
		elif [ "$opt" = "6" ]; then
			descargas
		elif [ "$opt" = "7" ]; then
			graficos
		elif [ "$opt" = "8" ]; then
			varios
		elif [ "$opt" = "0" ]; then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

principal