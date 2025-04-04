## Part 2: Hands-on Exercises

### Exercise 1: MySQL Replication Setup

#### 1.1 Configure Master Server
```bash
# Edit MySQL configuration
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

# Add these lines:
server-id = 1
log_bin = /var/log/mysql/mysql-bin.log
binlog_format = ROW
binlog_do_db = workshop_db

# Restart MySQL
sudo systemctl restart mysql
```

#### 1.2 Create Replication User
```sql
CREATE USER 'replicator'@'%' IDENTIFIED BY 'securepassword';
GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
FLUSH PRIVILEGES;
```

#### 1.3 Configure Slave Server
```bash
# Edit MySQL configuration
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

# Add these lines:
server-id = 2
relay_log = /var/log/mysql/mysql-relay-bin.log
log_bin = /var/log/mysql/mysql-bin.log
binlog_format = ROW
read_only = 1

# Restart MySQL
sudo systemctl restart mysql
```

#### 1.4 Initialize Replication
On master:
```sql
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
-- Note the File and Position values
```

On slave:
```sql
CHANGE MASTER TO
MASTER_HOST='master_ip',
MASTER_USER='replicator',
MASTER_PASSWORD='securepassword',
MASTER_LOG_FILE='filename_from_master',
MASTER_LOG_POS=position_from_master;

START SLAVE;
```

#### 1.5 Verify Replication
```sql
SHOW SLAVE STATUS\G
-- Look for Slave_IO_Running: Yes and Slave_SQL_Running: Yes
```

### Exercise 2: PostgreSQL Logical Replication

#### 2.1 Configure Publisher
```bash
# Edit postgresql.conf
wal_level = logical
max_wal_senders = 10
max_replication_slots = 10

# Edit pg_hba.conf
host    replication     replicator     0.0.0.0/0               md5
```

#### 2.2 Create Publication
```sql
CREATE PUBLICATION workshop_pub FOR ALL TABLES;
CREATE USER replicator WITH PASSWORD 'securepassword';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO replicator;
```

#### 2.3 Configure Subscriber
```sql
CREATE SUBSCRIPTION workshop_sub
CONNECTION 'host=publisher_host dbname=workshop_db user=replicator password=securepassword'
PUBLICATION workshop_pub;
```

#### 2.4 Monitor Replication
```sql
SELECT * FROM pg_stat_replication;
SELECT * FROM pg_replication_slots;
```

### Exercise 3: MongoDB Replica Set

#### 3.1 Configure Replica Set Members
```yaml
# mongod.conf for each member
replication:
  replSetName: "workshopRS"
net:
  bindIp: 0.0.0.0
```

#### 3.2 Initialize Replica Set
```javascript
// Connect to primary and run:
rs.initiate({
  _id: "workshopRS",
  members: [
    { _id: 0, host: "mongo1:27017" },
    { _id: 1, host: "mongo2:27017" },
    { _id: 2, host: "mongo3:27017" }
  ]
});
```

#### 3.3 Check Status
```javascript
rs.status()
```

#### 3.4 Test Failover
```javascript
// Step down primary
rs.stepDown()
```

