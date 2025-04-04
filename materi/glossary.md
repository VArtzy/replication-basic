# Glossary

## A

### Asynchronous Replication
Replication method where the primary database doesn't wait for replicas to confirm receipt before committing transactions.

## B

### Binary Log (binlog)
File in MySQL that records all data changes for replication purposes.

## C

### Conflict Resolution
Process of handling conflicting changes when they occur in multi-master replication setups.

## D

### Data Drift
Discrepancy that occurs when replicated data becomes inconsistent across nodes.

## F

### Failover
Automatic process of promoting a replica to primary when the current primary fails.

## H

### High Availability
System design approach that ensures minimal downtime through redundancy.

## L

### Logical Replication
Replication method that transfers data changes at the row or statement level rather than disk blocks.

## M

### Master-Slave Replication
Replication architecture where one primary node (master) handles writes and one or more secondary nodes (slaves) replicate its data.

## P

### Primary-Secondary Replication
Modern term for master-slave replication, emphasizing one writable primary and read-only secondaries.

## R

### Replication Lag
Delay between when data is written to the primary and when it appears in replicas.

## S

### Synchronous Replication
Replication method where the primary waits for confirmation from replicas before committing transactions.

## W

### Write-Ahead Log (WAL)
Log file used in PostgreSQL that records changes before they're written to disk, used for replication.

Would you like me to add more terms or expand any of these definitions? I can also organize them differently if you prefer.
