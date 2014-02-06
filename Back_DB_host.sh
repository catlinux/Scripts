#!/usr/bin/env expect
# Script para backup DB en host

# Datos conexión ssh
set USER Nuestro_usuario
set PASS Nuestra_pass
set HOST Dirección_host

# Datos connexión DB
set userDB Nuestro_usuario
set passDB Nuestra_pass
set hostDB Dirección_host_DB
set database Nombre_DB
 
# Conectamos al host mediante ssh
spawn ssh ${USER}@${HOST}
 
expect -re "password:"
send "${PASS}\r"
expect ">"
send "mysqldump --password=${passDB} --user=${userDB} -h ${hostDB} ${database} > Backup[exec date "+%d-%m-%Y_%H:%M"].sql\r"
send "exit\r"
expect "=>"
exit
