#!/usr/bin/env expect
# Script para backup DB en host
# Creado por MSG Sistemes (Marc Sancho)
# email: msanchogin@gmail.com

# Datos conexión ssh
set USER Nuestro_usuario
set PASS Nuestra_pass
set HOST Dirección_host

# Datos connexión DB
set userDB Nuestro_usuario
set passDB Nuestra_pass
set hostDB Dirección_host_DB
set database Nombre_DB

# Datos conexión FTP
set userFTP Nuestro_usuario
set passFTP Nuestra_pass
set hostFTP Dirección_host_FTP

# Directorios
set direcREMOTO Backups
set direcLOCAL Backups
 
# Conectamos al host mediante ssh
spawn ssh ${USER}@${HOST}
expect -re "password:"
send "${PASS}\r"
expect "sql>"
send "mysqldump --password=${passDB} --user=${userDB} -h ${hostDB} ${database} > ${direcREMOTO}/Backup_${database}_[exec date "+%d-%m-%Y"].sql\r"
send "exit\r"
expect "sql>"

# Conectamos al host mediante ftp
spawn ftp ftp.${hostFTP}
expect "Name:"
send "${userFTP}\r"
expect "Password:"
send "${passFTP}\r"
expect "ftp> "
send "cd /${direcREMOTO}\r"
expect "ftp>"
send "lcd ~/${direcLOCAL}\r"
expect "ftp>"
send "get Backup_${database}_[exec date "+%d-%m-%Y"].sql\r"
expect "ftp>"
send "bye\r"
exit
