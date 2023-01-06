#!/bin/bash

chown -R mysql:mysql /mysql/mysql-latest

/mysql/mysql-latest/bin/mysqld --defaults-file=/mysql/etc/my.cnf --initialize --user=mysql

echo "error check : " `grep -i err /mysql/log/err_log.log`
echo "root temp password : " `grep -i 'temporary password' /mysql/log/err_log.log | awk -F"host:" '{print $2}' `

# password를 Ttatest1! 로 설정
/mysql/mysql-latest/bin/mysql_secure_installation -h127.0.0.1
