#!/bin/bash
clear
## Comprobamos si tenemos el software necesario de lo contrario lo instalamos
if [ ! -x /usr/bin/youtube-dl ]; then
	echo "No tienes instalado el paquete \"youtube-dl\", vamos a instalarlo"
	sleep 5 && clear
	sudo pacman -Sy --noconfirm youtube-dl
	clear
fi
if [ ! -x /usr/bin/ffmpeg ]; then
	echo "No tienes instalado el paquete \"ffmpeg\", vamos a instalarlo"
	sleep 5 && clear
	sudo pacman -Sy --noconfirm ffmpeg
	clear
fi
## Comprobamos si tenemos el directorio de descargas youtube creado, de lo contrario lo crea
if [ ! -x /$HOME/Youtube ];then
	mkdir -p $HOME/Youtube/{Videos,Audio}
fi
## Variables de los directorios
audio="$HOME/Youtube/Audio"
video="$HOME/Youtube/Videos"
## Función descargar vídeo
function video
{
	## Escribiremos el link de descarga
	echo -e "Pegue aquí el link del video que quiere descargar: "
	read link
	## Descargamos y obtenemos el nombre del video
	youtube-dl -o "$video/"'%(title)s.%(ext)s' $link
	sleep 5 && clear
}
## Función extraer audio
function audio
{
	## Escribimos el link
	echo -e "Pegue aquí el link del audio a extraer: "
	read link
	## Extraemos el audio y obtenemos el nombre
	youtube-dl -o "$audio/"'%(title)s.%(ext)s' --extract-audio --audio-format mp3 --audio-quality 256K $link
	sleep 5 && clear
}
## Menú de opciones
opt=""
while [ "$opt" != "3" ]
do
	echo 1- Descargar vídeo de Youtube
	echo 2- Extraer audio de Youtube
	echo 3- Salir
	echo
	read -p "Selecciona una opción: " opt
	clear
	if [ "$opt" = "1" ]; then
		video
	elif [ "$opt" = "2" ]; then
		audio
	elif [ "$opt" = "3" ]; then
		break
	else
		echo "Escoge una opción correcta"
		sleep 3 && clear
	fi
done

