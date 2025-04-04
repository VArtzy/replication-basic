Microsoft Windows [Version 10.0.19045.4529]
(c) Microsoft Corporation. All rights reserved.

╭─ cmd     羽0ms                                                              100    4, 17:47  
╰─> ssh -i ~\.ssh\droplet root@MASTER_IP
Enter passphrase for key 'C:\Users\asus/\.ssh\droplet': 
Linux main 5.10.0-33-amd64 #1 SMP Debian 5.10.226-1 (2024-10-03) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the       
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Apr  4 10:44:40 2025 from 114.10.152.74
root@main:~# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 19
Server version: 8.0.37 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW MASTER;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL se
rver version for the right syntax to use near '' at line 1
mysql> SHOW MASTER STATUS;
+---------------+----------+--------------+------------------+-------------------+
| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+---------------+----------+--------------+------------------+-------------------+
| binlog.000002 |     1586 |              |                  |                   |
+---------------+----------+--------------+------------------+-------------------+
1 row in set (0.00 sec)

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
+--------------------+
4 rows in set (0.01 sec)

mysql> CREATE DATABASE workshop_db;
Query OK, 1 row affected (0.00 sec)

mysql> CREATE TABLE users (
    ->
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->
    ->     username VARCHAR(50) NOT NULL,
    ->
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ->
    -> );
ERROR 1046 (3D000): No database selected
mysql> use workshop_db;
Database changed
mysql> CREATE TABLE users (
    ->
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->
    ->     username VARCHAR(50) NOT NULL,
    ->
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ->
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO users (username) VALUES ('alice'), ('bob'), ('charlie');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
#
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.00 sec)

mysql> exit
Bye
root@main:~# vim /etc/mysql/mysql.conf.d/mysqld.cnf
root@main:~# systemctl restart mysql
root@main:~# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.37 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW MASTER STATUS;
+------------+----------+--------------+------------------+-------------------+
| File       | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+------------+----------+--------------+------------------+-------------------+
| bin.000001 |      157 | workshop_db  |                  |                   |
+------------+----------+--------------+------------------+-------------------+
1 row in set (0.00 sec)

mysql> CREATE DATABASE workshop2_db
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> use workshop2_db
Database changed
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| workshop2_db       |
| workshop_db        |
+--------------------+
6 rows in set (0.00 sec)

mysql> CREATE CREATE TABLE users (
    ->
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->
    ->     username VARCHAR(50) NOT NULL,
    ->
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ->
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL se
rver version for the right syntax to use near 'CREATE TABLE users (

    id INT AUTO_INCREMENT PRIMARY KEY,

    username VARCH' at line 1
mysql> CREATE TABLE users (      id INT AUTO_INCREMENT PRIMARY KEY,      username VARCHAR(50) NOT NULL,     
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  );
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW TABLES;
+------------------------+
| Tables_in_workshop2_db |
+------------------------+
| users                  |
+------------------------+
1 row in set (0.00 sec)

mysql> select * from users;
Empty set (0.00 sec)

mysql> INSERT INTO users (username) VALUES('budi'), ('eko'), ('farrel');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | budi     | 2025-04-04 11:06:48 |
|  2 | eko      | 2025-04-04 11:06:48 |
|  3 | farrel   | 2025-04-04 11:06:48 |
+----+----------+---------------------+
3 rows in set (0.00 sec)

mysql> use workshop_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from users;
+----+----------+---------------------+
| id | username | created_at          |
+----+----------+---------------------+
|  1 | alice    | 2025-04-04 10:54:55 |
|  2 | bob      | 2025-04-04 10:54:55 |
|  3 | charlie  | 2025-04-04 10:54:55 |
+----+----------+---------------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO users (username) VALUES('joko');
Query OK, 1 row affected (0.00 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| workshop2_db       |
| workshop_db        |
+--------------------+
6 rows in set (0.00 sec)

mysql> INSERT INTO users (username) VALUES('farrel');
Query OK, 1 row affected (0.00 sec)

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
5 rows in set (0.00 sec)

mysql> CREATE TABLE wallet(
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> balance INT NOT NULL,
    -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO wallet (balance) VALUES (10000), (20000), (50000)
    -> ;
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from wallet;
+----+---------+---------------------+
| id | balance | created_at          |
+----+---------+---------------------+
|  1 |   10000 | 2025-04-04 11:11:50 |
|  2 |   20000 | 2025-04-04 11:11:50 |
|  3 |   50000 | 2025-04-04 11:11:50 |
+----+---------+---------------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO users (username) VALUES('budi');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO users (username) VALUES('nurul');
Query OK, 1 row affected (0.00 sec)

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
7 rows in set (0.00 sec)

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_workshop_db |
+-----------------------+
| users                 |
| wallet                |
+-----------------------+
2 rows in set (0.00 sec)

mysql> exit
Bye
root@main:~# 
