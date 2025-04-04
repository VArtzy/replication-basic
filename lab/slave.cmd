Microsoft Windows [Version 10.0.19045.4529]
(c) Microsoft Corporation. All rights reserved.

╭─ cmd     羽0ms                                                               99    4, 16:47  
╰─> ssh -i ~\.ssh\droplet root@SLAVE_IP
Enter passphrase for key 'C:\Users\asus/\.ssh\droplet': 
Linux slave 5.10.0-33-amd64 #1 SMP Debian 5.10.226-1 (2024-10-03) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the       
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Apr  4 09:46:37 2025 from 114.10.151.15
root@slave:~# dpkg
dpkg: error: need an action option

Type dpkg --help for help about installing and deinstalling packages [*];
Use 'apt' or 'aptitude' for user-friendly package management;
Type dpkg -Dhelp for a list of dpkg debug flag values;
Type dpkg --force-help for a list of forcing options;
Type dpkg-deb --help for help about manipulating *.deb files;

Options marked [*] produce a lot of output - pipe it through 'less' or 'more' !
root@slave:~# cd /tmp
root@slave:/tmp# wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
--2025-04-04 09:51:41--  https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
Resolving dev.mysql.com (dev.mysql.com)... 104.69.162.9, 2600:1413:5000:187::2e31, 2600:1413:5000:181::2e31 
Connecting to dev.mysql.com (dev.mysql.com)|104.69.162.9|:443... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: https://repo.mysql.com//mysql-apt-config_0.8.22-1_all.deb [following]
--2025-04-04 09:51:41--  https://repo.mysql.com//mysql-apt-config_0.8.22-1_all.deb
Resolving repo.mysql.com (repo.mysql.com)... 23.210.109.97, 2600:1413:3800:299::1d68, 2600:1413:3800:289::1d
68
Connecting to repo.mysql.com (repo.mysql.com)|23.210.109.97|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 18012 (18K) [application/x-debian-package]
Saving to: ‘mysql-apt-config_0.8.22-1_all.deb’

mysql-apt-config_0.8.22-1_ 100%[========================================>]  17.59K  --.-KB/s    in 0s       

2025-04-04 09:51:41 (113 MB/s) - ‘mysql-apt-config_0.8.22-1_all.deb’ saved [18012/18012]

root@slave:/tmp# dpkg -i mysql-apt-config_0.8.22-1_all.deb
Selecting previously unselected package mysql-apt-config.
(Reading database ... 23786 files and directories currently installed.)
Preparing to unpack mysql-apt-config_0.8.22-1_all.deb ...
Unpacking mysql-apt-config (0.8.22-1) ...
Setting up mysql-apt-config (0.8.22-1) ...
Warning: apt-key should not be used in scripts (called from postinst maintainerscript of the package mysql-a
pt-config)
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
OK
root@slave:/tmp# apt-key adv --keyserver keyserver.ubuntu.com --recv-key=B7B3B788A8D3785C
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
Executing: /tmp/apt-key-gpghome.YRhFSQMoym/gpg.1.sh --keyserver keyserver.ubuntu.com --recv-key=B7B3B788A8D3
785C
root@slave:/tmp# apt install mysql-server
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Package mysql-server is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

E: Package 'mysql-server' has no installation candidate
root@slave:/tmp# apt update
Hit:1 http://security.debian.org/debian-security bullseye-security InRelease
Hit:2 http://deb.debian.org/debian bullseye InRelease
Hit:3 http://deb.debian.org/debian bullseye-updates InRelease
Hit:4 http://deb.debian.org/debian bullseye-backports InRelease
Get:5 http://repo.mysql.com/apt/debian bullseye InRelease [22.7 kB]
Hit:6 https://repos-droplet.digitalocean.com/apt/droplet-agent main InRelease
Err:5 http://repo.mysql.com/apt/debian bullseye InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY B7B3B788A
8D3785C
Reading package lists... Done
W: GPG error: http://repo.mysql.com/apt/debian bullseye InRelease: The following signatures couldn't be veri
fied because the public key is not available: NO_PUBKEY B7B3B788A8D3785C
E: The repository 'http://repo.mysql.com/apt/debian bullseye InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
root@slave:/tmp# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys=B7B3B788A8D3785C
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
Executing: /tmp/apt-key-gpghome.NPaZ4iikes/gpg.1.sh --keyserver keyserver.ubuntu.com --recv-keys=B7B3B788A8D
3785C
root@slave:/tmp# apt update
Hit:1 http://security.debian.org/debian-security bullseye-security InRelease
Hit:2 http://deb.debian.org/debian bullseye InRelease
Hit:3 http://deb.debian.org/debian bullseye-updates InRelease
Hit:4 http://deb.debian.org/debian bullseye-backports InRelease
Get:5 http://repo.mysql.com/apt/debian bullseye InRelease [22.7 kB]
Hit:6 https://repos-droplet.digitalocean.com/apt/droplet-agent main InRelease
Err:5 http://repo.mysql.com/apt/debian bullseye InRelease
  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY B7B3B788A
8D3785C
Reading package lists... Done
W: GPG error: http://repo.mysql.com/apt/debian bullseye InRelease: The following signatures couldn't be veri
fied because the public key is not available: NO_PUBKEY B7B3B788A8D3785C
E: The repository 'http://repo.mysql.com/apt/debian bullseye InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
root@slave:/tmp# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
Executing: /tmp/apt-key-gpghome.4e7RQhoSJ9/gpg.1.sh --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D
3785C
gpg: key B7B3B788A8D3785C: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1
root@slave:/tmp# apt install mysql-server
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Package mysql-server is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

E: Package 'mysql-server' has no installation candidate
root@slave:/tmp# apt update
Get:1 http://repo.mysql.com/apt/debian bullseye InRelease [22.7 kB]
Hit:2 http://deb.debian.org/debian bullseye InRelease
Hit:3 http://deb.debian.org/debian bullseye-updates InRelease
Hit:4 http://deb.debian.org/debian bullseye-backports InRelease
Hit:5 http://security.debian.org/debian-security bullseye-security InRelease
Hit:6 https://repos-droplet.digitalocean.com/apt/droplet-agent main InRelease
Get:7 http://repo.mysql.com/apt/debian bullseye/mysql-8.0 Sources [950 B]
Get:8 http://repo.mysql.com/apt/debian bullseye/mysql-apt-config amd64 Packages [566 B]
Get:9 http://repo.mysql.com/apt/debian bullseye/mysql-8.0 amd64 Packages [12.6 kB]
Get:10 http://repo.mysql.com/apt/debian bullseye/mysql-tools amd64 Packages [4105 B]
Fetched 41.0 kB in 1s (58.0 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
40 packages can be upgraded. Run 'apt list --upgradable' to see them.
root@slave:/tmp# apt install mysql-server
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libgdbm-compat4 libmecab2 libnuma1 libperl5.32 mecab-ipadic mecab-ipadic-utf8 mecab-utils mysql-client    
  mysql-common mysql-community-client mysql-community-client-core mysql-community-client-plugins
  mysql-community-server mysql-community-server-core perl perl-base perl-modules-5.32
Suggested packages:
  perl-doc libterm-readline-gnu-perl | libterm-readline-perl-perl make libtap-harness-archive-perl
The following NEW packages will be installed:
  libgdbm-compat4 libmecab2 libnuma1 libperl5.32 mecab-ipadic mecab-ipadic-utf8 mecab-utils mysql-client    
  mysql-common mysql-community-client mysql-community-client-core mysql-community-client-plugins
  mysql-community-server mysql-community-server-core mysql-server perl perl-modules-5.32
The following packages will be upgraded:
  perl-base
1 upgraded, 17 newly installed, 0 to remove and 39 not upgraded.
Need to get 53.7 MB of archives.
After this operation, 419 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://deb.debian.org/debian bullseye/main amd64 libgdbm-compat4 amd64 1.19-2 [44.7 kB]
Get:2 http://deb.debian.org/debian bullseye/main amd64 libmecab2 amd64 0.996-14+b4 [221 kB]                 
Get:3 http://deb.debian.org/debian bullseye/main amd64 libnuma1 amd64 2.0.12-1+b1 [26.3 kB]      
Get:4 http://security.debian.org/debian-security bullseye-security/main amd64 perl-base amd64 5.32.1-4+deb11
u4 [1629 kB]
Get:5 http://deb.debian.org/debian bullseye/main amd64 mecab-utils amd64 0.996-14+b4 [8944 B]
Get:6 http://deb.debian.org/debian bullseye/main amd64 mecab-ipadic all 2.7.0-20070801+main-3 [6718 kB]     
emitting matrix      : 100% |###########################################|

done!
update-alternatives: using /var/lib/mecab/dic/ipadic-utf8 to provide /var/lib/mecab/dic/debian (mecab-dictio
nary) in auto mode
Setting up mysql-community-client (8.0.37-1debian11) ...
Setting up mysql-client (8.0.37-1debian11) ...
Setting up mysql-community-server (8.0.37-1debian11) ...
update-alternatives: using /etc/mysql/mysql.cnf to provide /etc/mysql/my.cnf (my.cnf) in auto mode
dpkg: error processing package mysql-server (--configure):
# separately licensed software that they have either included with
 dependency problems - leaving unconfigured
Processing triggers for man-db (2.9.4-2) ...
Processing triggers for libc-bin (2.31-13+deb11u11) ...
Errors were encountered while processing:
 mysql-community-server
 mysql-server
E: Sub-process /usr/bin/dpkg returned an error code (1)
root@slave:/tmp# apt install mysql-server
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
mysql-server is already the newest version (8.0.37-1debian11).
0 upgraded, 0 newly installed, 0 to remove and 39 not upgraded.
2 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Do you want to continue? [Y/n] y
Setting up mysql-community-server (8.0.37-1debian11) ...
Created symlink /etc/systemd/system/multi-user.target.wants/mysql.service → /lib/systemd/system/mysql.servic
e.
Job for mysql.service failed.
See "systemctl status mysql.service" and "journalctl -xe" for details.
Job for mysql.service failed.
See "systemctl status mysql.service" and "journalctl -xe" for details.
Setting up mysql-server (8.0.37-1debian11) ...
root@slave:/tmp# mysql --version
mysql  Ver 8.0.37 for Linux on x86_64 (MySQL Community Server - GPL)
root@slave:/tmp# vim /etc/mysql/mysql.conf.d/mysqld.cnf
"/etc/mysql/mysql.conf.d/mysqld.cnf" 38L, 1527B written
root@slave:/tmp# mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:/tmp# mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:/tmp# mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:/tmp# mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:/tmp# mysql -u root -p
Enter password:
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:/tmp# mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:/tmp# mysql -u root -p
Enter password:
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:/tmp# mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:/tmp# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.37 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rahasia';
Query OK, 0 rows affected (0.04 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.01 sec)

mysql> exit
Bye
root@slave:/tmp# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 8.0.37 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CHANGE MASTER TO
    -> MASTER_HOST='MASTER_IP'client_loop: send disconnect: Connection reset

╭─ cmd     羽21m 48s 971ms                                                    100    4, 17:09  
╰─> ssh -i ~\.ssh\droplet root@SLAVE_IP
Enter passphrase for key 'C:\Users\asus/\.ssh\droplet': 
Linux slave 5.10.0-33-amd64 #1 SMP Debian 5.10.226-1 (2024-10-03) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Apr  4 09:47:29 2025 from 114.10.151.15
root@slave:~# mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
root@slave:~# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.37 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CHANGE MASTER TO
    -> MASTER_HOST='MASTER_IP',
    -> MASTER_USER='replicator',
    -> MASTER_PASSWORD='rahasia',
    -> ^C
mysql> CHANGE MASTER TO
    -> MASTER_HOST='MASTER_IP',
    -> MASTER_USER='replicator',
    -> MASTER_PASSWORD='rahasia1',
    -> MASTER_LOG_FILE='binlog.000002',
    -> MASTER_LOG_POS=1586;
Query OK, 0 rows affected, 8 warnings (0.05 sec)

mysql> START SLAVE;
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State:
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 1586
               Relay_Log_File: slave-relay-bin.000001
                Relay_Log_Pos: 4
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: No
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 1586
              Relay_Log_Space: 157
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 13117
                Last_IO_Error: Fatal error: The replica I/O thread stops because source and replica have equ
al MySQL server ids; these ids must be different for replication to work (or the --replicate-same-server-id 
option must be used on replica but this does not always make sense; please check the manual before using it)
.
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID:
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:13:09
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.01 sec)

mysql> UNLOCK TABLES;
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State:
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 1586
               Relay_Log_File: slave-relay-bin.000001
                Relay_Log_Pos: 4
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: No
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 1586
              Relay_Log_Space: 157
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 13117
                Last_IO_Error: Fatal error: The replica I/O thread stops because source and replica have equ
al MySQL server ids; these ids must be different for replication to work (or the --replicate-same-server-id 
option must be used on replica but this does not always make sense; please check the manual before using it)
.
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID:
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:13:09
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.00 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State:
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 1586
               Relay_Log_File: slave-relay-bin.000001
                Relay_Log_Pos: 4
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: No
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 1586
              Relay_Log_Space: 157
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 13117
                Last_IO_Error: Fatal error: The replica I/O thread stops because source and replica have equ
al MySQL server ids; these ids must be different for replication to work (or the --replicate-same-server-id 
option must be used on replica but this does not always make sense; please check the manual before using it)
.
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID:
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:13:09
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.00 sec)

mysql> client_loop: send disconnect: Connection reset

╭─ cmd     羽34m 55s 476ms                                                    100    4, 17:44  
╰─> ssh -i ~\.ssh\droplet root@SLAVE_IP
Enter passphrase for key 'C:\Users\asus/\.ssh\droplet': 
Linux slave 5.10.0-33-amd64 #1 SMP Debian 5.10.226-1 (2024-10-03) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Apr  4 10:09:20 2025 from 114.10.151.15
root@slave:~# mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 26
Server version: 8.0.37 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> STOP SLAVE
    -> ;
Query OK, 0 rows affected, 1 warning (0.06 sec)

mysql> exit
Bye
root@slave:~# vim /etc/mysql//
conf.d/          my.cnf           my.cnf.fallback  mysql.cnf        mysql.conf.d/
root@slave:~# vim /etc/mysql/
conf.d/          my.cnf           my.cnf.fallback  mysql.cnf        mysql.conf.d/
root@slave:~# vim /etc/mysql/mysql.conf.d/
root@slave:~# vim /etc/mysql/mysql.conf.d/mysqld.cnf
root@slave:~# systemctl restart mysql
root@slave:~# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.37 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> RESET SLAVE;
Query OK, 0 rows affected, 1 warning (0.07 sec)

mysql> CHANGE MASTER TO
    -> MASTER_HOST='MASTER_IP',
    -> MASTER_USER='replicator',
    -> MASTER_PASSWORD='rahasia1',
    -> MASTER_LOG_FILE='binlog.000002',
    -> MASTER_LOG_POS=1586;
Query OK, 0 rows affected, 8 warnings (0.04 sec)

mysql> START SLAVE;
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for source to send event
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 1586
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 323
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 1586
              Relay_Log_Space: 527
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.00 sec)

mysql> show TABLES;
ERROR 1046 (3D000): No database selected
mysql> SHOW TABLES;
ERROR 1046 (3D000): No database selected
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| workshop_db        |
+--------------------+
5 rows in set (0.02 sec)

mysql> use workshop_db
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT * from users;
Empty set (0.03 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.05 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.03 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.01 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.05 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.03 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.05 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.04 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.01 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for source to send event
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.03 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for source to send event
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.03 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Reconnecting after a failed source event read
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 2003
                Last_IO_Error: Error reconnecting to source 'replicator@MASTER_IP:3306'. This was attem
pt 1/86400, with a delay of 60 seconds between attempts. Message: Can't connect to MySQL server on '146.190.
111.51:3306' (111)
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:59:01
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.03 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Reconnecting after a failed source event read
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 2003
                Last_IO_Error: Error reconnecting to source 'replicator@MASTER_IP:3306'. This was attem
pt 1/86400, with a delay of 60 seconds between attempts. Message: Can't connect to MySQL server on '146.190.
111.51:3306' (111)
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:59:01
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.03 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Reconnecting after a failed source event read
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 2003
                Last_IO_Error: Error reconnecting to source 'replicator@MASTER_IP:3306'. This was attem
pt 1/86400, with a delay of 60 seconds between attempts. Message: Can't connect to MySQL server on '146.190.
111.51:3306' (111)
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:59:01
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.03 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Reconnecting after a failed source event read
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 2003
                Last_IO_Error: Error reconnecting to source 'replicator@MASTER_IP:3306'. This was attem
pt 1/86400, with a delay of 60 seconds between attempts. Message: Can't connect to MySQL server on '146.190.
111.51:3306' (111)
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:59:01
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.02 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Reconnecting after a failed source event read
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 2003
                Last_IO_Error: Error reconnecting to source 'replicator@MASTER_IP:3306'. This was attem
pt 1/86400, with a delay of 60 seconds between attempts. Message: Can't connect to MySQL server on '146.190.
111.51:3306' (111)
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:59:01
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.02 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Reconnecting after a failed source event read
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 2003
                Last_IO_Error: Error reconnecting to source 'replicator@MASTER_IP:3306'. This was attem
pt 1/86400, with a delay of 60 seconds between attempts. Message: Can't connect to MySQL server on '146.190.
111.51:3306' (111)
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:59:01
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.02 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Reconnecting after a failed source event read
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: Connecting
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 2003
                Last_IO_Error: Error reconnecting to source 'replicator@MASTER_IP:3306'. This was attem
pt 1/86400, with a delay of 60 seconds between attempts. Message: Can't connect to MySQL server on '146.190.
111.51:3306' (111)
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 10:59:01
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.03 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State:
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: No
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 13114
                Last_IO_Error: Got fatal error 1236 from source when reading data from binary log: 'Could no
t find first log file name in binary log index file'
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 11:00:01
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.04 sec)

mysql> STOP SLAVE;
Query OK, 0 rows affected, 1 warning (0.10 sec)

mysql> START SLAVE;
Query OK, 0 rows affected, 1 warning (0.11 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State:
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: No
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 13114
                Last_IO_Error: Got fatal error 1236 from source when reading data from binary log: 'Could no
t find first log file name in binary log index file'
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 11:00:32
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.02 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State:
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: No
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 13114
                Last_IO_Error: Got fatal error 1236 from source when reading data from binary log: 'Could no
t find first log file name in binary log index file'
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 11:00:32
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.04 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State:
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: binlog.000002
          Read_Master_Log_Pos: 2466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 1203
        Relay_Master_Log_File: binlog.000002
             Slave_IO_Running: No
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2466
              Relay_Log_Space: 1407
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 13114
                Last_IO_Error: Got fatal error 1236 from source when reading data from binary log: 'Could no
t find first log file name in binary log index file'
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp: 250404 11:00:32
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.02 sec)

mysql> RESET SLAVE;
ERROR 3081 (HY000): This operation cannot be performed with running replication threads; run STOP REPLICA FO
R CHANNEL '' first
mysql> STOP SLAVE;
Query OK, 0 rows affected, 1 warning (0.08 sec)

mysql> RESET SLAVE;
Query OK, 0 rows affected, 1 warning (0.11 sec)

mysql> CHANGE MASTER TO
    -> MASTER_HOST='MASTER_IP',
    -> MASTER_USER='replicator',
    -> MASTER_PASSWORD='rahasia1',
    -> MASTER_LOG_FILE='bin.000001',
    -> MASTER_LOG_POS=157;
Query OK, 0 rows affected, 8 warnings (0.10 sec)

mysql> START SLAVE;
Query OK, 0 rows affected, 1 warning (0.17 sec)

mysql> SHOW SLAVE STATUS:
    -> ^C
mysql> SHOW SLAVE STATUS;
+----------------------------------+----------------+-------------+-------------+---------------+-----------
------+---------------------+------------------+---------------+-----------------------+------------------+-
------------------+-----------------+---------------------+--------------------+------------------------+---
----------------------+-----------------------------+------------+------------+--------------+--------------
-------+-----------------+-----------------+----------------+---------------+--------------------+----------
----------+--------------------+-----------------+-------------------+----------------+---------------------
--+-------------------------------+---------------+---------------+----------------+----------------+-------
----------------------+------------------+--------------------------------------+-------------------------+-
----------+---------------------+----------------------------------------------------------+----------------
----+-------------+-------------------------+--------------------------+----------------+-------------------
-+--------------------+-------------------+---------------+----------------------+--------------+-----------
---------+------------------------+-----------------------+-------------------+
| Slave_IO_State                   | Master_Host    | Master_User | Master_Port | Connect_Retry | Master_Log
_File | Read_Master_Log_Pos | Relay_Log_File   | Relay_Log_Pos | Relay_Master_Log_File | Slave_IO_Running | 
Slave_SQL_Running | Replicate_Do_DB | Replicate_Ignore_DB | Replicate_Do_Table | Replicate_Ignore_Table | Re
plicate_Wild_Do_Table | Replicate_Wild_Ignore_Table | Last_Errno | Last_Error | Skip_Counter | Exec_Master_L
og_Pos | Relay_Log_Space | Until_Condition | Until_Log_File | Until_Log_Pos | Master_SSL_Allowed | Master_SS
L_CA_File | Master_SSL_CA_Path | Master_SSL_Cert | Master_SSL_Cipher | Master_SSL_Key | Seconds_Behind_Maste
r | Master_SSL_Verify_Server_Cert | Last_IO_Errno | Last_IO_Error | Last_SQL_Errno | Last_SQL_Error | Replic
ate_Ignore_Server_Ids | Master_Server_Id | Master_UUID                          | Master_Info_File        | 
SQL_Delay | SQL_Remaining_Delay | Slave_SQL_Running_State                                  | Master_Retry_Co
unt | Master_Bind | Last_IO_Error_Timestamp | Last_SQL_Error_Timestamp | Master_SSL_Crl | Master_SSL_Crlpath
 | Retrieved_Gtid_Set | Executed_Gtid_Set | Auto_Position | Replicate_Rewrite_DB | Channel_Name | Master_TLS
_Version | Master_public_key_path | Get_master_public_key | Network_Namespace |
+----------------------------------+----------------+-------------+-------------+---------------+-----------
------+---------------------+------------------+---------------+-----------------------+------------------+-
------------------+-----------------+---------------------+--------------------+------------------------+---
----------------------+-----------------------------+------------+------------+--------------+--------------
-------+-----------------+-----------------+----------------+---------------+--------------------+----------
----------+--------------------+-----------------+-------------------+----------------+---------------------
--+-------------------------------+---------------+---------------+----------------+----------------+-------
----------------------+------------------+--------------------------------------+-------------------------+-
----------+---------------------+----------------------------------------------------------+----------------
----+-------------+-------------------------+--------------------------+----------------+-------------------
-+--------------------+-------------------+---------------+----------------------+--------------+-----------
---------+------------------------+-----------------------+-------------------+
| Waiting for source to send event | MASTER_IP | replicator  |        3306 |            60 | bin.000001
      |                 157 | relay-bin.000002 |           320 | bin.000001            | Yes              | 
Yes               |                 |                     |                    |                        |   
                      |                             |          0 |            |            0 |
   157 |             524 | None            |                |             0 | No                 |
          |                    |                 |                   |                |
0 | No                            |             0 |               |              0 |                |       
                      |                1 | 431e3da6-113a-11f0-8935-ba8cdb8aeede | mysql.slave_master_info | 
        0 |                NULL | Replica has read all relay log; waiting for more updates |              86
400 |             |                         |                          |                |
 |                    |                   |             0 |                      |              |
         |                        |                     0 |                   |
+----------------------------------+----------------+-------------+-------------+---------------+-----------
------+---------------------+------------------+---------------+-----------------------+------------------+-
------------------+-----------------+---------------------+--------------------+------------------------+---
----------------------+-----------------------------+------------+------------+--------------+--------------
-------+-----------------+-----------------+----------------+---------------+--------------------+----------
----------+--------------------+-----------------+-------------------+----------------+---------------------
--+-------------------------------+---------------+---------------+----------------+----------------+-------
----------------------+------------------+--------------------------------------+-------------------------+-
----------+---------------------+----------------------------------------------------------+----------------
----+-------------+-------------------------+--------------------------+----------------+-------------------
-+--------------------+-------------------+---------------+----------------------+--------------+-----------
---------+------------------------+-----------------------+-------------------+
1 row in set, 1 warning (0.02 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for source to send event
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: bin.000001
          Read_Master_Log_Pos: 157
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 320
        Relay_Master_Log_File: bin.000001
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 157
              Relay_Log_Space: 524
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.02 sec)

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_workshop_db |
+-----------------------+
| users                 |
+-----------------------+
1 row in set (0.09 sec)

mysql> SHOW DATABASE;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL se
rver version for the right syntax to use near 'DATABASE' at line 1
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| workshop_db        |
+--------------------+
5 rows in set (0.06 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| workshop_db        |
+--------------------+
5 rows in set (0.09 sec)

mysql> select * from users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.04 sec)

mysql> select * from users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
|  4 | joko     | 2025-04-04 11:07:57 |
+----+----------+---------------------+
4 rows in set (0.09 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| workshop_db        |
+--------------------+
5 rows in set (0.11 sec)

mysql> STOP SLAVE;
Query OK, 0 rows affected, 1 warning (0.15 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State:
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: bin.000001
          Read_Master_Log_Pos: 466
               Relay_Log_File: relay-bin.000002
                Relay_Log_Pos: 629
        Relay_Master_Log_File: bin.000001
             Slave_IO_Running: No
            Slave_SQL_Running: No
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 466
              Relay_Log_Space: 833
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: NULL
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State:
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.03 sec)

mysql> select * from users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
|  4 | joko     | 2025-04-04 11:07:57 |
+----+----------+---------------------+
4 rows in set (0.07 sec)

mysql> START SLAVE;
Query OK, 0 rows affected, 1 warning (0.17 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for source to send event
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: bin.000001
          Read_Master_Log_Pos: 777
               Relay_Log_File: relay-bin.000003
                Relay_Log_Pos: 631
        Relay_Master_Log_File: bin.000001
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 777
              Relay_Log_Space: 1307
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.05 sec)

mysql> select * from users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
|  4 | joko     | 2025-04-04 11:07:57 |
|  5 | farrel   | 2025-04-04 11:08:59 |
+----+----------+---------------------+
5 rows in set (0.07 sec)

mysql> STOP SLAVE;
Query OK, 0 rows affected, 1 warning (0.15 sec)

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_workshop_db |
+-----------------------+
| users                 |
+-----------------------+
1 row in set (0.12 sec)

mysql> select * from users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
|  4 | joko     | 2025-04-04 11:07:57 |
|  5 | farrel   | 2025-04-04 11:08:59 |
+----+----------+---------------------+
5 rows in set (0.06 sec)

mysql> START SLAVE;
Query OK, 0 rows affected, 1 warning (0.13 sec)

mysql> SHOW SLAVE STATUS;
+----------------------------------+----------------+-------------+-------------+---------------+-----------
------+---------------------+------------------+---------------+-----------------------+------------------+-
------------------+-----------------+---------------------+--------------------+------------------------+---
----------------------+-----------------------------+------------+------------+--------------+--------------
-------+-----------------+-----------------+----------------+---------------+--------------------+----------
----------+--------------------+-----------------+-------------------+----------------+---------------------
--+-------------------------------+---------------+---------------+----------------+----------------+-------
----------------------+------------------+--------------------------------------+-------------------------+-
----------+---------------------+----------------------------------------------------------+----------------
----+-------------+-------------------------+--------------------------+----------------+-------------------
-+--------------------+-------------------+---------------+----------------------+--------------+-----------
---------+------------------------+-----------------------+-------------------+
| Slave_IO_State                   | Master_Host    | Master_User | Master_Port | Connect_Retry | Master_Log
_File | Read_Master_Log_Pos | Relay_Log_File   | Relay_Log_Pos | Relay_Master_Log_File | Slave_IO_Running | 
Slave_SQL_Running | Replicate_Do_DB | Replicate_Ignore_DB | Replicate_Do_Table | Replicate_Ignore_Table | Re
plicate_Wild_Do_Table | Replicate_Wild_Ignore_Table | Last_Errno | Last_Error | Skip_Counter | Exec_Master_L
og_Pos | Relay_Log_Space | Until_Condition | Until_Log_File | Until_Log_Pos | Master_SSL_Allowed | Master_SS
L_CA_File | Master_SSL_CA_Path | Master_SSL_Cert | Master_SSL_Cipher | Master_SSL_Key | Seconds_Behind_Maste
r | Master_SSL_Verify_Server_Cert | Last_IO_Errno | Last_IO_Error | Last_SQL_Errno | Last_SQL_Error | Replic
ate_Ignore_Server_Ids | Master_Server_Id | Master_UUID                          | Master_Info_File        | 
SQL_Delay | SQL_Remaining_Delay | Slave_SQL_Running_State                                  | Master_Retry_Co
unt | Master_Bind | Last_IO_Error_Timestamp | Last_SQL_Error_Timestamp | Master_SSL_Crl | Master_SSL_Crlpath
 | Retrieved_Gtid_Set | Executed_Gtid_Set | Auto_Position | Replicate_Rewrite_DB | Channel_Name | Master_TLS
_Version | Master_public_key_path | Get_master_public_key | Network_Namespace |
+----------------------------------+----------------+-------------+-------------+---------------+-----------
------+---------------------+------------------+---------------+-----------------------+------------------+-
------------------+-----------------+---------------------+--------------------+------------------------+---
----------------------+-----------------------------+------------+------------+--------------+--------------
-------+-----------------+-----------------+----------------+---------------+--------------------+----------
----------+--------------------+-----------------+-------------------+----------------+---------------------
--+-------------------------------+---------------+---------------+----------------+----------------+-------
----------------------+------------------+--------------------------------------+-------------------------+-
----------+---------------------+----------------------------------------------------------+----------------
----+-------------+-------------------------+--------------------------+----------------+-------------------
-+--------------------+-------------------+---------------+----------------------+--------------+-----------
---------+------------------------+-----------------------+-------------------+
| Waiting for source to send event | MASTER_IP | replicator  |        3306 |            60 | bin.000001
      |                2033 | relay-bin.000004 |          1576 | bin.000001            | Yes              | 
Yes               |                 |                     |                    |                        |   
                      |                             |          0 |            |            0 |
  2033 |            2254 | None            |                |             0 | No                 |
          |                    |                 |                   |                |
0 | No                            |             0 |               |              0 |                |       
                      |                1 | 431e3da6-113a-11f0-8935-ba8cdb8aeede | mysql.slave_master_info | 
        0 |                NULL | Replica has read all relay log; waiting for more updates |              86
400 |             |                         |                          |                |
 |                    |                   |             0 |                      |              |
         |                        |                     0 |                   |
+----------------------------------+----------------+-------------+-------------+---------------+-----------
------+---------------------+------------------+---------------+-----------------------+------------------+-
------------------+-----------------+---------------------+--------------------+------------------------+---
----------------------+-----------------------------+------------+------------+--------------+--------------
-------+-----------------+-----------------+----------------+---------------+--------------------+----------
----------+--------------------+-----------------+-------------------+----------------+---------------------
--+-------------------------------+---------------+---------------+----------------+----------------+-------
----------------------+------------------+--------------------------------------+-------------------------+-
----------+---------------------+----------------------------------------------------------+----------------
----+-------------+-------------------------+--------------------------+----------------+-------------------
-+--------------------+-------------------+---------------+----------------------+--------------+-----------
---------+------------------------+-----------------------+-------------------+
1 row in set, 1 warning (0.04 sec)

mysql> SHOW SLAVE STATUS\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for source to send event
                  Master_Host: MASTER_IP
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: bin.000001
          Read_Master_Log_Pos: 2033
               Relay_Log_File: relay-bin.000004
                Relay_Log_Pos: 1576
        Relay_Master_Log_File: bin.000001
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 2033
              Relay_Log_Space: 2254
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids:
             Master_Server_Id: 1
                  Master_UUID: 431e3da6-113a-11f0-8935-ba8cdb8aeede
             Master_Info_File: mysql.slave_master_info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Replica has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind:
      Last_IO_Error_Timestamp:
     Last_SQL_Error_Timestamp:
               Master_SSL_Crl:
           Master_SSL_Crlpath:
           Retrieved_Gtid_Set:
            Executed_Gtid_Set:
                Auto_Position: 0
         Replicate_Rewrite_DB:
                 Channel_Name:
           Master_TLS_Version:
       Master_public_key_path:
        Get_master_public_key: 0
            Network_Namespace:
1 row in set, 1 warning (0.04 sec)

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_workshop_db |
+-----------------------+
| users                 |
| wallet                |
+-----------------------+
2 rows in set (0.17 sec)

mysql> select * from users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
|  4 | joko     | 2025-04-04 11:07:57 |
|  5 | farrel   | 2025-04-04 11:08:59 |
|  6 | budi     | 2025-04-04 11:12:08 |
|  7 | nurul    | 2025-04-04 11:12:12 |
+----+----------+---------------------+
7 rows in set (0.10 sec)

mysql> select * from wallet;
+----+---------+---------------------+
| id | balance | created_at          |
+----+---------+---------------------+
|  1 |   10000 | 2025-04-04 11:11:50 |
|  2 |   20000 | 2025-04-04 11:11:50 |
|  3 |   50000 | 2025-04-04 11:11:50 |
+----+---------+---------------------+
3 rows in set (0.11 sec)

mysql> exit
Bye
root@slave:~# exit
