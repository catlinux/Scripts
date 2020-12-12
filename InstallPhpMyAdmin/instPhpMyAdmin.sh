#!/bin/sh

# INSTALAMOS PROGRAMAS ESENCIALES
sudo apt install php-mbstring php-zip php-gd wget php-phpseclib php-gettext php-mysqli php-pear php-mysql

# OBTENEMOS EL NOMBRE DE ARCHIVO DE LA ÚLTIMA VERSIÓN
DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
URL="$(echo $DATA | cut -d ' ' -f 3)"
VERSION="$(echo $DATA | cut -d ' ' -f 1)"

# DESCARGAMOS LA ÚLTIMA VERSIÓN
wget https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz

# DESCOMPRIMIMOS EL ARCHIVO Y LUEGO BORRAMOS EL ARCHIVO DESCARGADO
tar xvf phpMyAdmin-${VERSION}-all-languages.tar.gz
rm phpMyAdmin-${VERSION}-all-languages.tar.gz

# MOVEMOS EL DIRECTORIO DESCARGADO A SU UBICACIÓN, CREAMOS EL DIRECTORIO PARA LOS TEMPORALES Y ASIGNAMOS EL PROPIETARIO
sudo mv phpMyAdmin-*/ /usr/share/phpmyadmin
sudo mkdir -p /var/lib/phpmyadmin/tmp
sudo chown -R www-data:www-data /var/lib/phpmyadmin

# CREAMOS EL ARCHIVO DE CONFIGURACIÓN Y LO CONFIGURAMOS
sudo cp /usr/share/phpmyadmin/config.sample.inc.php  /usr/share/phpmyadmin/config.inc.php

sudo sed -i  's/$cfg\[.blowfish_secret.\] = .*$/$cfg\["blowfish_secret"\] = "hgfY5TR48KJNnbt61JHu789GFmUg98Gt";/g' /usr/share/phpmyadmin/config.inc.php
sed -i '$a $cfg\["TempDir"\] = "/var/lib/phpmyadmin/tmp";' /usr/share/phpmyadmin/config.inc.php

#DESCARGAMOS EL ARCHIVO PARA LA CONFIGURACIÓN DE APACHE Y LO UBICAMOS EN EL LUGAR CORRECTO
wget https://raw.githubusercontent.com/catlinux/Scripts/master/InstallPhpMyAdmin/phpmyadmin.conf
sudo mv phpmyadmin.conf /etc/apache2/conf-enabled/

# REINICIAMOS APACHE
sudo systemctl restart apache2
