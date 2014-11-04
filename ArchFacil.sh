#!/bin/bash

printf "\e[8;30;100;t" && clear

## Variables
CABEZERA1="####################################################################"
CABEZERA2="##                                                                ##"
CABEZERA3="## Script para instalar y configurar varios aspectos de Archlinux ##"
MENU_ALMO="##############################"
MENU_PRPL="##      Menú principal      ##"
MENU_APL="##    Menú Aplicaciones     ##"
MENU_ACCS="##    Menú de Accesorios    ##"
MENU_INET="##      Menú Internet       ##"
MENU_OFMT="##    Menú de Ofimática     ##"
MENU_MULT="##     Menú Multimedia      ##"
MENU_DESC="##     Menú de Descargas    ##"
MENU_GRFC="##  Menú Gráficos e Imagen  ##"
MENU_VARI="##   Menú programas varios  ##"
MENU_CONF="##   Configuración Sistema  ##"
MENU_ESCR="##  Entornos de escritorio  ##"
MENU_GRAF="##   Instalación gráficas   ##"
MENU_MANT="##   Mantenimiento Sistema  ##"
MENU_USUA="##    Gestión de usuarios   ##"
ROJO='\e[0;31m'
AZUL='\e[0;34m'
VERDE='\e[0;32m'
NARANJA='\e[0;33m'
NC='\e[0m'
WPS="WPS Kingsoft office"
LIBRE="Libre Office"
EOG="Eye of Gnome"
NTFS="ntfs-3g"
ACTUALIZA="Actualización del Sistema"
VBOX="VirtualBox (Vesa)"

echo ""
echo ""
echo ""
printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
printf "${AZUL} %*s\n" $(((${#CABEZERA2}+100)/2)) "$CABEZERA2"
printf "${AZUL} %*s\n" $(((${#CABEZERA3}+100)/2)) "$CABEZERA3"
printf "${AZUL} %*s\n" $(((${#CABEZERA2}+100)/2)) "$CABEZERA2"
printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
echo -e "${NC}"
sleep 5 && clear

function config
{
	config=""
	while [ "$config" != "0" ]
	do
		echo 1- "Cambia el nombre de tu equipo (hostname)"
		echo 2- "Zona horaria"
		echo 3- "Idioma del sistema (locale.conf y locale.gen)"
		echo ""
		echo 0- Menú anterior
		echo
		read -p "Selecciona una opción: " config
		clear
		if [ "$config" = "1" ]; then
			clear
			echo "Escribe el nombre que le quieres poner a tu equipo"
			echo ""
			read -p "Nombe del equipo: " hostname
			hostn=$(cat /etc/hostname)
			sudo sed -i "s/$hostn/$hostname/g" /etc/hostname
			clear && echo Nombre del equipo cambiado a $hostname
			sleep 3 && clear
		elif [ "$config" = "2" ]; then
			localtime
		elif [ "$config" = "3" ]; then
			locale
				elif [ "$config" = "0" ]; then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function localtime
{
	localtime=""
	while [ "$localtime" != "0" ]
	do
		echo 1- Europa
		echo 2- América - Argentina
		echo 3- América
		echo ""
		echo 0- Menú anterior
		echo
		read -p "Selecciona una opción: " localtime
		clear
		if [ "$localtime" = "1" ]; then
			europa
		elif [ "$localtime" = "2" ]; then
			argentina
		elif [ "$localtime" = "3" ]; then
			america
		elif [ "$localtime" = "0" ]; then
			break
		else
			echo "Escoge una zona"
		fi
	done
}

function europa
{
	europa=""
	while [ "$europa" != "0" ]
	do
		echo 1- Madrid
		echo 2- Andorra
		echo ""
		echo 0- Menú anterior
		echo
		read -p "Selecciona una opción: " europa
		clear
		if [ "$europa" = "1" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime
			clear && echo "Zona local canviada a Madrid"
			sleep 3 && break
		elif [ "$europa" = "2" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/Europe/Andorra /etc/localtime
			clear && echo "Zona local canviada a Andorra"
			sleep 3 && break
		elif [ "$europa" = "0" ]; then
			break
		else
			echo "Escoge tu zona correcta"
		fi
	done
}

function argentina
{
	argentina=""
	while [ "$argentina" != "0" ]
	do
		echo 1- Buenos Aires
		echo 2- Catamarca
		echo 3- ComodRivadavia
		echo 4- Cordoba
		echo 5- Jujuy
		echo 6- La Rioja
		echo 7- Mendoza
		echo 8- Rio Gallegos
		echo 9- Salta
		echo 10- San Juan
		echo 11- San Luis
		echo 12- Tucuman
		echo 13- Ushuaia
		echo ""
		echo 0- Menú anterior
		echo
		read -p "Selecciona una opción: " argentina
		clear
		if [ "$argentina" = "1" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
			clear && echo "Zona local canviada a Buenos Aires"
			sleep 3 && break
		elif [ "$argentina" = "2" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Catamarca /etc/localtime
			clear && echo "Zona local canviada a Catamarca"
			sleep 3 && break
		elif [ "$argentina" = "3" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/ComodRivadavia /etc/localtime
			clear && echo "Zona local canviada a ComodRivadavia"
			sleep 3 && break
		elif [ "$argentina" = "4" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Cordoba /etc/localtime
			clear && echo "Zona local canviada a Cordoba"
			sleep 3 && break
		elif [ "$argentina" = "5" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Jujuy /etc/localtime
			clear && echo "Zona local canviada a Jujuy"
			sleep 3 && break
		elif [ "$argentina" = "6" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/La_Rioja /etc/localtime
			clear && echo "Zona local canviada a La Rioja"
			sleep 3 && break
		elif [ "$argentina" = "7" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Mendoza /etc/localtime
			clear && echo "Zona local canviada a Mendoza"
			sleep 3 && break
		elif [ "$argentina" = "8" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Rio_Gallegos /etc/localtime
			clear && echo "Zona local canviada a Rio Gallegos"
			sleep 3 && break
		elif [ "$argentina" = "9" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Salta /etc/localtime
			clear && echo "Zona local canviada a Salta"
			sleep 3 && break
		elif [ "$argentina" = "10" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/San_Juan /etc/localtime
			clear && echo "Zona local canviada a San Juan"
			sleep 3 && break
		elif [ "$argentina" = "11" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/San_Luis /etc/localtime
			clear && echo "Zona local canviada a San Luis"
			sleep 3 && break
		elif [ "$argentina" = "12" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Tucuman /etc/localtime
			clear && echo "Zona local canviada a Tucuman"
			sleep 3 && break
		elif [ "$argentina" = "13" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Argentina/Ushuaia /etc/localtime
			clear && echo "Zona local canviada a Ushuaia"
			sleep 3 && break
		elif [ "$argentina" = "0" ]; then
			break
		else
			echo "Escoge tu zona correcta"
		fi
	done
}

function america
{
	america=""
	while [ "$america" != "0" ]
	do
		echo 1- Bogota
		echo 2- Caracas
		echo 3- Costa Rica
		echo 4- El Salvador
		echo 5- Guatemala
		echo 6- La Paz
		echo 7- Lima
		echo 8- Merida
		echo 9- Mexico City
		echo 10- Santiago
		echo ""
		echo 0- Menú anterior
		echo
		read -p "Selecciona una opción: " america
		clear
		if [ "$america" = "1" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime
			clear && echo "Zona local canviada a Bogota"
			sleep 3 && break
		elif [ "$america" = "2" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Caracas /etc/localtime
			clear && echo "Zona local canviada a Caracas"
			sleep 3 && break
		elif [ "$america" = "3" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Costa_Rica /etc/localtime
			clear && echo "Zona local canviada a Costa Rica"
			sleep 3 && break
		elif [ "$america" = "4" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/El_Salvador /etc/localtime
			clear && echo "Zona local canviada a El Salvador"
			sleep 3 && break
		elif [ "$america" = "5" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Guatemala /etc/localtime
			clear && echo "Zona local canviada a Guatemala"
			sleep 3 && break
		elif [ "$america" = "6" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/La_Paz /etc/localtime
			clear && echo "Zona local canviada a La Paz"
			sleep 3 && break
		elif [ "$america" = "7" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Lima /etc/localtime
			clear && echo "Zona local canviada a Lima"
			sleep 3 && break
		elif [ "$america" = "8" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Merida /etc/localtime
			clear && echo "Zona local canviada a Merida"
			sleep 3 && break
		elif [ "$america" = "9" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Mexico_City /etc/localtime
			clear && echo "Zona local canviada a Mexico City"
			sleep 3 && break
		elif [ "$america" = "10" ]; then
			sudo rm /etc/localtime
			sudo ln -s /usr/share/zoneinfo/America/Santiago /etc/localtime
			clear && echo "Zona local canviada a Santiago"
			sleep 3 && break
		elif [ "$america" = "0" ]; then
			break
		else
			echo "Escoge tu zona correcta"
		fi
	done
}

function locale
{
	locale=""
	while [ "$locale" != "0" ]
	do
		echo 1- Español
		echo 2- Catalán
		echo 3- Argentino
		echo 4- Chile
		echo 5- Colombia
		echo 6- México
		echo 7- Venezuela
		echo 8- América Latina
		echo ""
		echo 0- Menú anterior
		echo
		read -p "Selecciona una opción: " locale
		clear
		if [ "$locale" = "1" ]; then
			localen=$(cat /etc/locale.conf)
			sudo sed -i "s/$localen/LANG=es_ES.UTF-8/g" /etc/locale.conf
			sudo sed -i "s/#es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/" /etc/locale.gen
			sudo locale-gen
			vconsole=$(cat /etc/vconsole.conf)
			sudo sed -i "s/$vconsole/KEYMAP=es/g" /etc/vconsole.conf
			clear && echo "El idioma del sistema se ha cambiado a español de España" && sleep 3 && break
		elif [ "$locale" = "2" ]; then
			localen=$(cat /etc/locale.conf)
			sudo sed -i "s/$localen/LANG=ca_ES.UTF-8/g" /etc/locale.conf
			sudo sed -i "s/#ca_ES.UTF-8 UTF-8/ca_ES.UTF-8 UTF-8/" /etc/locale.gen
			sudo locale-gen
			vconsole=$(cat /etc/vconsole.conf)
			sudo sed -i "s/$vconsole/KEYMAP=es/g" /etc/vconsole.conf
			clear && echo "El idioma del sistema se ha cambiado a catalán" && sleep 3 && break
		elif [ "$locale" = "3" ]; then
			localen=$(cat /etc/locale.conf)
			sudo sed -i "s/$localen/LANG=es_AR.UTF-8/g" /etc/locale.conf
			sudo sed -i "s/#es_AR.UTF-8 UTF-8/es_AR.UTF-8 UTF-8/" /etc/locale.gen
			sudo locale-gen
			vconsole=$(cat /etc/vconsole.conf)
			sudo sed -i "s/$vconsole/KEYMAP=es/g" /etc/vconsole.conf
			clear && echo "El idioma del sistema se ha cambiado español de Argentina" && sleep 3 && break
		elif [ "$locale" = "4" ]; then
			localen=$(cat /etc/locale.conf)
			sudo sed -i "s/$localen/LANG=es_CL.UTF-8/g" /etc/locale.con
			sudo sed -i "s/#es_CL.UTF-8 UTF-8/es_CL.UTF-8 UTF-8/" /etc/locale.gen
			sudo locale-gen
			vconsole=$(cat /etc/vconsole.conf)
			sudo sed -i "s/$vconsole/KEYMAP=es/g" /etc/vconsole.conf
			clear && echo "El idioma del sistema se ha cambiado a español de Chile" && sleep 3 && break
		elif [ "$locale" = "5" ]; then
			localen=$(cat /etc/locale.conf)
			sudo sed -i "s/$localen/LANG=es_CO.UTF-8/g" /etc/locale.con
			sudo sed -i "s/#es_CO.UTF-8 UTF-8/es_CO.UTF-8 UTF-8/" /etc/locale.gen
			sudo locale-gen
			vconsole=$(cat /etc/vconsole.conf)
			sudo sed -i "s/$vconsole/KEYMAP=es/g" /etc/vconsole.conf
			clear && echo "El idioma del sistema se ha cambiado a español de Colombia" && sleep 3 && break
		elif [ "$locale" = "6" ]; then
			localen=$(cat /etc/locale.conf)
			sudo sed -i "s/$localen/LANG=es_MX.UTF-8/g" /etc/locale.con
			sudo sed -i "s/#es_MX.UTF-8 UTF-8/es_MX.UTF-8 UTF-8/" /etc/locale.gen
			sudo locale-gen
			vconsole=$(cat /etc/vconsole.conf)
			sudo sed -i "s/$vconsole/KEYMAP=es/g" /etc/vconsole.conf
			clear && echo "El idioma del sistema se ha cambiado a español de México" && sleep 3 && break
		elif [ "$locale" = "7" ]; then
			localen=$(cat /etc/locale.conf)
			sudo sed -i "s/$localen/LANG=es_VE.UTF-8/g" /etc/locale.con
			sudo sed -i "s/#es_VE.UTF-8 UTF-8/es_VE.UTF-8 UTF-8/" /etc/locale.gen
			sudo locale-gen
			vconsole=$(cat /etc/vconsole.conf)
			sudo sed -i "s/$vconsole/KEYMAP=es/g" /etc/vconsole.conf
			clear && echo "El idioma del sistema se ha cambiado a español de Venezuela" && sleep 3 && break
		elif [ "$locale" = "8" ]; then
			localen=$(cat /etc/locale.conf)
			sudo sed -i "s/$localen/LANG=es_LA.UTF-8/g" /etc/locale.con
			sudo sed -i "s/#es_LA.UTF-8 UTF-8/es_LA.UTF-8 UTF-8/" /etc/locale.gen
			sudo locale-gen
			vconsole=$(cat /etc/vconsole.conf)
			sudo sed -i "s/$vconsole/KEYMAP=es/g" /etc/vconsole.conf
			clear && echo "El idioma del sistema se ha cambiado a español de América Latina" && sleep 3 && break
		elif [ "$locale" = "0" ]; then
			break
		else
			echo "Escoge una zona correcta"
		fi
	done
}

function usuarios
{
	usuarios=""
	while [ "$usuarios" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_USUA}+102)/2)) "$MENU_USUA"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Creación de usuario
		echo 2- Cambiar contraseña de usuario
		echo 3- Cambiar contraseña de root
		echo 4- Añadir un usuario en un grupo
		echo 5- Quitar un usuario de un grupo
		echo 6- Borrar usuario
		echo 7- Borrar usuario salvando los datos
		echo ""
		echo 0- Menú anterior
		echo
		read -p "Selecciona una opción: " usuarios
		clear   
		if [ "$usuarios" = "1" ]; then
			echo "El usuario se incluirá en los grupos por defecto:"
			echo "audio, ftp, lp, optical, storage, video, wheel, games, power, scanner, uucp"
			echo ""
			read -p "Escribe el nombre de usuario: " usuario
			egrep "^$usuario" /etc/passwd >/dev/null
			if [ $? -eq 0 ]; then
				clear && echo "$usuario ya existe! Escoge otro nombre"
				sleep 3 && clear
			else
				sudo useradd -m -g users -G audio,ftp,lp,optical,storage,video,wheel,games,power,scanner,uucp -s /bin/bash $usuario
				sudo passwd $usuario
				sudo chfn $usuario
				[ $? -eq 0 ] && echo "El usuario se ha creado correctamente!" || echo "Ha ocurrido un error al crear el usuario!"    
				echo ""
				sleep 4 && clear
			fi
		elif [ "$usuarios" = "2" ]; then
			read -p  "Escribe el nombre de usuario al que quieres cambiar la contraseña: " usario_pass
			egrep "^$usario_pass" /etc/passwd >/dev/null
			if [ $? -eq 0 ]; then
				sudo passwd $usario_pass
				sleep 3
				clear
			else
				clear
				echo "Este usuario no existe en este sistema" && sleep 3
				clear
			fi
		elif [ "$usuarios" = "3" ]; then
			clear
			read -p "Vamos a cambiar la contraseña de root (admin del sistema). Estás completamente seguro (si/no)? " root_pass
			if [ "$root_pass" = "no" ]; then
				clear
			else
				sudo passwd root
				sleep 3 && clear
			fi
		elif [ "$usuarios" = "4" ]; then
			clear
			echo "Estos son algunos de los grupos más comunes para los usuarios"
			echo ""
			echo -e "root \t\t disk \t\t lp \t\t wheel \t\t ftp \t\t mail \t\t uucp \t\t log \t\t rfkill \t network \t video \t\t audio \t\t optical \t floppy \t storage \t scanner \t power \t\t bumblebee \t colord \t vboxusers"
			echo ""
			read -p  "Escoge un grupo: " group
			read -p  "Escribe el nombre de usuario al que quieres añadir en un grupo: " usario_group
			egrep "^$group" /etc/group >/dev/null
			if [ $? -eq 0 ]; then
				egrep "^$usario_group" /etc/passwd >/dev/null
				if [ $? -eq 0 ]; then
					sudo usermod -a -G $group $usario_group
					sleep 3
					clear
				else
					clear
					echo "Este usuario no existe en este sistema" && sleep 3
					clear
				fi
			else
				echo "Este grupo no existe en este sistema" && sleep 3
			fi

		elif [ "$usuarios" = "5" ]; then
			clear
			read -p  "Escribe el nombre de usuario al que quieres quitar de un grupo: " usario_del_group
			egrep "^$usario_del_group" /etc/passwd >/dev/null
			if [ $? -eq 0 ]; then
				echo ""
				echo "Estos son los grupos a los que pertenece $usario_del_group:"
				groups $usario_del_group
				echo ""
				read -p  "Escribe el grupo al que quieres sacar al usaurio $usario_del_group: " del_group
				egrep "^$del_group" /etc/group >/dev/null
				if [ $? -eq 0 ]; then
					sudo gpasswd -d $usario_del_group $del_group
					sleep 3
					clear
				else
					echo "No has escrito correctamente el nombre del grupo"
					sleep 3
					clear
				fi
			else
				echo "No existe este nombre de usuario"
			fi
		elif [ "$usuarios" = "6" ]; then
			clear && echo ""
			echo "Si eliminas este usuario vas a perder todos sus datos y no podrás recuperarlos nunca!"
			read -p "Estas seguro que quieres seguir (si/no)? " si_no
			if [ "$si_no" = "no" ]; then
				clear
				break
			elif [ "$si_no" = "si" ]; then
				read -p "Escribe el nombre de usuario que quieres eliminar: " usuario_del
				egrep "^$usuario_del" /etc/passwd >/dev/null
				if [ $? -eq 0 ]; then
					clear && read -p "Seguro que quieres eliminar $usuario_del y todos sus datos (si/no)? " confirma_si_no
					if [ "$confirma_si_no" = "no" ]; then
						clear && echo "" 
						echo "El usuario $usuario_del no ha sido eliminado" && sleep 3
						clear
						break
					elif [ "$confirma_si_no" = "si" ]; then
						sudo userdel -r $usuario_del
						clear
						echo "Has eliminado el usuario, toda su configuración y sus datos"
						sleep 3 && clear
					else
						echo "Escoge una zona correcta"
					fi
				else
					clear && echo ""
					echo "Este usuario no existe en el sistema"
					sleep 3 && clear
				fi
			else
				echo "Escoge una zona correcta"
				sleep 3 && clear
			fi
		elif [ "$usuarios" = "7" ]; then
			clear && echo ""
			echo "Si eliminas este usuario se creará una copia de sus archivos y configuración en:"
			echo "/home/UsuariosBorrados"
			read -p "Estas seguro que quieres seguir (si/no)? " si_no
			if [ "$si_no" = "no" ]; then
				clear
				break
			elif [ "$si_no" = "si" ]; then
				read -p "Escribe el nombre de usuario que quieres eliminar: " usuario_del
				egrep "^$usuario_del" /etc/passwd >/dev/null
				if [ $? -eq 0 ]; then
					clear && read -p "Seguro que quieres eliminar $usuario_del con respaldo de datos (si/no)? " confirma_resp
					if [ "$confirma_resp" = "no" ]; then
						clear && echo "" 
						echo "El usuario $usuario_del no ha sido eliminado" && sleep 3
						clear
						break
					elif [ "$confirma_resp" = "si" ]; then
						if [ ! -d /home/UsuariosBorrados ]; then
							sudo mkdir /home/UsuariosBorrados
						fi
						sudo tar czvf /home/UsuariosBorrados/$usuario_del.tar.gz /home/$usuario_del
						sudo userdel -r $usuario_del
						sudo rm -r /home/$usuario_del
						clear
						echo "Has eliminado el usuario, salvando toda su configuración y sus datos"
						sleep 3 && clear
					else
						echo "Escoge una zona correcta"
					fi
				else
					clear && echo ""
					echo "Este usuario no existe en el sistema"
					sleep 3 && clear
				fi
			else
				echo "Escoge una zona correcta"
				sleep 3 && clear
			fi
		elif [ "$usuarios" = "0" ]; then
			break
		else
			echo "Escoge una zona correcta"
			sleep 3 && clear
		fi
	done
}

function configura
{
	configura=""
	while [ "$configura" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_CONF}+102)/2)) "$MENU_CONF"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Instalación de repositorios AUR y yaourt
		echo 2- Habilitar repositorios Multilib
		echo 3- Configuración archivos del sistema
		echo 4- Gestión de usuarios
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " configura 
		clear   
		if [ "$configura" = "1" ]; then
			if [ ! -z $(grep "archlinuxfr" "/etc/pacman.conf") ]; then
   				sudo pacman -Sy --noconfirm yaourt && clear
				echo "Repositorios AUR habilitados y yaourt instalado" && sleep 3 && clear
			else (
				echo ""
				echo "[archlinuxfr]"
				echo "SigLevel = Never"
				echo "Server = http://repo.archlinux.fr/\$arch") | sudo tee -a /etc/pacman.conf >/dev/null
				sudo pacman -Sy --noconfirm yaourt && clear
				echo "Repositorios AUR habilitados y yaourt instalado" && sleep 3 && clear
			fi
		elif [ "$configura" = "2" ]; then
			if [ "`uname -m`" = "x86_64" ]; then
				if [ ! -z $(grep "#\[multilib\]" "/etc/pacman.conf") ] && [ -z $(grep "^\[multilib\]" "/etc/pacman.conf") ]; then
					clear
					echo "Habilitando repositorios multilib" && sleep 3
					(
					echo ""
					echo "[multilib]"
					echo "Include = /etc/pacman.d/mirrorlist") | sudo tee -a /etc/pacman.conf >/dev/null
					clear 
					echo "Repositorios multilib habilitados" && sleep 3 && clear
				else 
					clear 
					echo "Ya tenías habilitados los repositorios multilib" && sleep 3 && clear
				fi
			else
				clear 
				echo "Este sistema no es 64bits, no necesitas multilib" && sleep 3 && clear
			fi
		elif [ "$configura" = "3" ]; then
			config
		elif [ "$configura" = "4" ]; then
			usuarios
		elif [ "$configura" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function escritorio
{
	escritorio=""
	while [ "$escritorio" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_ESCR}+100)/2)) "$MENU_ESCR"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Instalar Gnome
		echo 2- Instalar Cinnamon
		echo 3- Instalar Mate
		echo 4- Instalar KDE
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " escritorio 
		clear
		if [ "$escritorio" = "1" ]; then
				printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${AZUL} %*s\n" $(((gnome+100)/2)) "gnome"
				printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo -e "${NC}"
				echo ""
				echo "Se va a instalar el entorno de escritorio gnome y un gestor de sesiones,"
				echo "también se instalarán algunos programas básicos para este entorno."
				sleep 6 && clear
				sudo pacman -Sy --noconfirm xorg-server xorg-xinit xorg-server-utils mesa gnome gnome-extra gdm lxdm 
				sudo systemctl enable NetworkManager
				sudo systemctl start NetworkManager
				clear
				echo "Debes escoger uno de los dos gestores de sesión disponibles: gdm o lxdm"
				while [ "$opcion" != 3 ]
				do
					echo ""
					echo "1. gdm - gestor de Gnome compatible con Cinnamon y Mate"
					echo "2. lxdm - gestor muy ligero compatible con Gnome, Mate y Cinnamon"
					echo ""
					echo "0. No instalar ningún gestor"
					read -p "Selecciona una opcion: " opcion
					case $opcion in
						1) sudo rm /etc/systemd/system/display-manager.service && sudo systemctl enable gdm && break;;
						2) sudo rm /etc/systemd/system/display-manager.service && sudo systemctl enable lxdm && break;;
						0) break;;
						*) echo "$opc es una opcion invalida.";
						echo "Presiona una tecla para continuar...";
						clear
						read foo;;
					esac
				done
				sleep 4 && clear
		elif [ "$escritorio" = "2" ]; then
				printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${AZUL} %*s\n" $(((Cinnamon+100)/2)) "Cinnamon"
				printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo -e "${NC}"
				echo ""
				echo "Se va a instalar el entorno de escritorio Cinnamon y un gestor de sesiones,"
				echo "también se instalarán algunos programas básicos para este entorno."
				sleep 6 && clear
				sudo pacman -Sy --noconfirm xorg-server xorg-xinit xorg-server-utils mesa gnome gdm lxdm cinnamon cinnamon-control-center cinnamon-screensaver nemo gnome-alsamixer nemo-fileroller 
				sudo systemctl enable NetworkManager
				sudo systemctl start NetworkManager
				clear
				echo "Debes escoger uno de los dos gestores de sesión disponibles: gdm o lxdm"
				while [ "$opcion" != 3 ]
				do
					echo ""
					echo "1. gdm - gestor de Gnome compatible con Cinnamon y Mate"
					echo "2. lxdm - gestor muy ligero compatible con Gnome, Mate y Cinnamon"
					echo ""
					echo "0. No instalar ningún gestor"
					read -p "Selecciona una opcion: " opcion
					case $opcion in
						1) sudo rm /etc/systemd/system/display-manager.service && sudo systemctl enable gdm && break;;
						2) sudo rm /etc/systemd/system/display-manager.service && sudo systemctl enable lxdm && break;;
						0) break;;
						*) echo "$opc es una opcion invalida.";
						echo "Presiona una tecla para continuar...";
						clear
						read foo;;
					esac
				done
				sleep 4 && clear
		elif [ "$escritorio" = "3" ]; then
				printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${AZUL} %*s\n" $(((Mate+100)/2)) "Mate"
				printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo -e "${NC}"
				echo ""
				echo "Se va a instalar el entorno de escritorio Mate y un gestor de sesiones,"
				echo "también se instalarán algunos programas básicos para este entorno."
				sleep 6 && clear
				sudo pacman -Sy --noconfirm xorg-server xorg-xinit xorg-server-utils mesa mate mate-extra 
				sudo systemctl enable NetworkManager
				sudo systemctl start NetworkManager
				clear
				echo "Debes escoger uno de los dos gestores de sesión disponibles: gdm o lxdm"
				while [ "$opcion" != 3 ]
				do
					echo ""
					echo "1. gdm - gestor de Gnome compatible con Cinnamon y Mate"
					echo "2. lxdm - gestor muy ligero compatible con Gnome, Mate y Cinnamon"
					echo ""
					echo "0. No instalar ningún gestor"
					read -p "Selecciona una opcion: " opcion
					case $opcion in
						1) sudo rm /etc/systemd/system/display-manager.service && sudo systemctl enable gdm && break;;
						2) sudo rm /etc/systemd/system/display-manager.service && sudo systemctl enable lxdm && break;;
						0) break;;
						*) echo "$opc es una opcion invalida.";
						echo "Presiona una tecla para continuar...";
						clear
						read foo;;
					esac
				done
				sleep 4 && clear
		elif [ "$escritorio" = "4" ]; then
				printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${AZUL} %*s\n" $(((KDE+100)/2)) "KDE"
				printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo -e "${NC}"
				echo ""
				echo "Se va a instalar el entorno de escritorio KDE y el gestor de sesiones KDM,"
				echo "también se instalarán algunos programas básicos para este entorno."
				sleep 6 && clear
				sudo pacman -Sy --noconfirm xorg-server xorg-xinit xorg-server-utils mesa kde-meta kde-l10n-es kdeplasma-applets-plasma-nm apper  
				sudo systemctl enable NetworkManager
				sudo systemctl start NetworkManager
				sudo rm /etc/systemd/system/display-manager.service && sudo systemctl enable kdm.service
				sleep 4 && clear
				break
		elif [ "$escritorio" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function graficas
{
	graficas=""
	while [ "$graficas" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_GRAF}+104)/2)) "$MENU_GRAF"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Controladores nvidia
		echo 2- Controladores Catalyst
		echo 3- Controladores Intel
		echo 4- "Controladores Intel + Nvidia (Bumblebee)"
		echo 5- "Controladores para instalar bajo VirtualBox"
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " graficas 
		clear
		if [ "$graficas" = "1" ]; then
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((nvidia+100)/2)) "nvidia"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "OPCIÓN NO DISPONIBLE (PRÓXIMAMENTE)"
				echo -e "${NC}"
			sleep 4 && clear
		elif [ "$graficas" = "2" ]; then
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Catalyst+100)/2)) "Catalyst"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "OPCIÓN NO DISPONIBLE (PRÓXIMAMENTE)"
				echo -e "${NC}"
			sleep 4 && clear
		elif [ "$graficas" = "3" ]; then
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Intel+100)/2)) "Intel"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "OPCIÓN NO DISPONIBLE (PRÓXIMAMENTE)"
				echo -e "${NC}"
			sleep 4 && clear
		elif [ "$graficas" = "4" ]; then
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Bumblebee+100)/2)) "Bumblebee"
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "OPCIÓN NO DISPONIBLE (PRÓXIMAMENTE)"
				echo -e "${NC}"
			sleep 4 && clear
		elif [ "$graficas" = "5" ]; then
			printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
			printf "${AZUL} %*s\n" $(((${#VBOX}+100)/2)) "$VBOX"
			printf "${AZUL} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
			echo -e "${NC}"
			echo ""
			echo "Se van a instalar los controladores y servicios necesarios para que los gráficos"
			echo "funcionen correctamente en la máquina virtual bajo VirtualBox"
			sleep 6 && clear
			sudo pacman -Sy --noconfirm xf86-video-vesa
			sudo pacman -Sy --noconfirm virtualbox-guest-utils virtualbox-guest-modules virtualbox-guest-modules-lts virtualbox-guest-dkms
			echo vboxguest | sudo tee -a /etc/modules-load.d/virtualbox.conf
			echo vboxsf | sudo tee -a /etc/modules-load.d/virtualbox.conf
			echo vboxvideo | sudo tee -a /etc/modules-load.d/virtualbox.conf
			sudo systemctl enable vboxservice.service
			clear
		elif [ "$graficas" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function mantenimiento
{
	mantenimiento=""
	while [ "$mantenimiento" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_MANT}+100)/2)) "$MENU_MANT"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Actualizar sistema
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " mantenimiento 
		clear
		if [ "$mantenimiento" = "1" ]; then
			if [ -x /usr/bin/yaourt ]; then
				yaourt -Syua --noconfirm && clear
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((${#ACTUALIZA}+100)/2)) "$ACTUALIZA"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "Se ha actualizado el sistema mediante Yaourt"
				echo -e "${NC}"
			else
				sudo pacman -Syu --noconfirm && clear
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((${#ACTUALIZA}+100)/2)) "$ACTUALIZA"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "Se ha actualizado el sistema mediante Pacman"
				echo -e "${NC}"
			fi
			sleep 4 && clear
		elif [ "$mantenimiento" = "0" ];then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

function accesorios
{
	accesorios=""
	while [ "$accesorios" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_ACCS}+102)/2)) "$MENU_ACCS"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Gnome-system-momitor\(EOG\) - visor de imágenes
		echo 2- VirtualBox - Instalar máquinas virtuales
		echo 3- Gedit - Editor de texto
		echo 4- Unetbootin - Graba iso\'s en tu pendrive
		echo 5- Gnome-screenshot - Capturas de pantalla con la tecla \"imp pant\"
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
		elif [ "$accesorios" = "5" ]; then
			sudo pacman -Sy --noconfirm gnome-screenshot && clear
			if [ -x /usr/bin/gnome-screenshot ];then
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${VERDE} %*s\n" $(((Gnome-screenshot+100)/2)) "Gnome-screenshot"
				printf "${VERDE} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				echo ""
				echo "SE HA INSTALADO CORRECTAMENTE"
				echo -e "${NC}"
			else
				clear
				printf "${ROJO} %*s\n" $(((${#CABEZERA1}+100)/2)) "$CABEZERA1"
				printf "${ROJO} %*s\n" $(((Gnome-screenshot+100)/2)) "Gnome-screenshot"
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
		echo 5- Jre7-openjdk - para correr programas en java
		echo 6- Ntf3-3g - Para poder acceder a particiones ntfs con permisos de lectura y escritura
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
			if [ -x /usr/bin/java ];then
				sudo pacman -Sy --noconfirm jre7-openjdk && clear
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

function aplicaciones
{
	aplicaciones=""
	while [ "$aplicaciones" != "0" ]
	do
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		printf "${AZUL} %*s\n" $(((${#MENU_APL}+102)/2)) "$MENU_APL"
		printf "${AZUL} %*s\n" $(((${#MENU_ALMO}+100)/2)) "$MENU_ALMO"
		echo -e "${NC}"
		echo 1- Accesorios
		echo 2- Internet
		echo 3- Ofimática
		echo 4- Multimedia
		echo 5- Descargas
		echo 6- Gráficos
		echo 7- Varios
		echo ""
		echo 0- Salir al menú principal
		echo
		read -p "Selecciona una opción: " aplicaciones
		clear
		if [ "$aplicaciones" = "1" ]; then
			accesorios
		elif [ "$aplicaciones" = "2" ]; then
			internet
		elif [ "$aplicaciones" = "3" ]; then
			ofimatica
		elif [ "$aplicaciones" = "4" ]; then
			multimedia
		elif [ "$aplicaciones" = "5" ]; then
			descargas
		elif [ "$aplicaciones" = "6" ]; then
			graficos
		elif [ "$aplicaciones" = "7" ]; then
			varios
		elif [ "$aplicaciones" = "0" ]; then
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
		echo 1- Configuración de sistema
		echo 2- Entornos de escritorio
		echo 3- Drivers targetas gráficas
		echo 4- Mantenimiento de sistema
		echo 5- Instalar paquetes de aplicaciones
		echo ""
		echo 0- Salir del script
		echo
		read -p "Selecciona una opción: " opt
		clear
		if [ "$opt" = "1" ]; then
			configura
		elif [ "$opt" = "2" ]; then
			escritorio
		elif [ "$opt" = "3" ]; then
			graficas
		elif [ "$opt" = "4" ]; then
			mantenimiento
		elif [ "$opt" = "5" ]; then
			aplicaciones
		elif [ "$opt" = "0" ]; then
			break
		else
			echo "Escoge una opción correcta"
		fi
	done
}

principal