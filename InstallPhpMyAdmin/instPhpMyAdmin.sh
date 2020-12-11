#!/bin/sh

sudo apt install php-mbstring php-zip php-gd wget php-phpseclib php-gettext php-mysqli php-pear php-mysql

DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
URL="$(echo $DATA | cut -d ' ' -f 3)"
VERSION="$(echo $DATA | cut -d ' ' -f 1)"
wget https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz

tar xvf phpMyAdmin-${VERSION}-all-languages.tar.gz
rm phpMyAdmin-${VERSION}-all-languages.tar.gz
