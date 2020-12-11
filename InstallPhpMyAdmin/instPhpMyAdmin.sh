#!/bin/sh

sudo apt install php-mbstring php-zip php-gd wget php-phpseclib php-gettext php-mysqli php-pear php-mysql

DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
URL="$(echo $DATA | cut -d ' ' -f 3)"
VERSION="$(echo $DATA | cut -d ' ' -f 1)"
wget https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz

tar xvf phpMyAdmin-${VERSION}-all-languages.tar.gz
rm phpMyAdmin-${VERSION}-all-languages.tar.gz

sudo mv phpMyAdmin-*/ /usr/share/phpmyadmin
sudo mkdir -p /var/lib/phpmyadmin/tmp
sudo chown -R www-data:www-data /var/lib/phpmyadmin

sudo cp /usr/share/phpmyadmin/config.sample.inc.php  /usr/share/phpmyadmin/config.inc.php

sudo sed -i  's/$cfg\[.blowfish_secret.\] = .*$/$cfg\["blowfish_secret"\] = "hgfY5TR48KJNnbt61JHu789GFmUg98Gt";/g' /usr/share/phpmyadmin/config.inc.php
sed -i '$a $cfg\["TempDir"\] = "/var/lib/phpmyadmin/tmp";' /usr/share/phpmyadmin/config.inc.php

wget https://raw.githubusercontent.com/catlinux/Scripts/master/InstallPhpMyAdmin/phpmyadmin.conf
sudo mv phpmyadmin.conf /etc/apache2/conf-enabled/

sudo systemctl restart apache2
