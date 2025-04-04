## Part 1: Theoretical Foundations

### 1.1 What is Database Replication?
**Definition:** The process of copying data from one database server to another to maintain consistent copies across multiple locations.

**Key Benefits:**
- High availability
- Load distribution
- Geographic distribution
- Disaster recovery

### 1.2 Replication Models
1. **Master-Slave (Primary-Secondary)**
   - Single writable master, multiple read-only replicas
   - Example use case: Read scaling

2. **Multi-Master (Peer-to-Peer)**
   - All nodes can accept writes
   - Conflict resolution required
   - Example use case: Geographic distribution

3. **Leader-Follower**
   - Similar to master-slave but with automatic failover
   - Example use case: High availability clusters

### 1.3 Replication Methods
1. **Synchronous vs. Asynchronous**
   - Sync: Wait for all replicas to confirm before committing
   - Async: Commit locally then propagate changes

2. **Logical vs. Physical Replication**
   - Logical: Replicate SQL statements or row changes
   - Physical: Replicate disk block changes

3. **Statement-Based vs. Row-Based vs. Mixed**
   - Statement: Replicate SQL statements
   - Row: Replicate changed rows
   - Mixed: Combination based on operations

### 1.4 Common Challenges
- Replication lag
- Conflict resolution
- Network partitions
- Schema changes

### BONUS Material!

Observe at website this repository at `src` directory, you will see raw implementation of simple replication system in python! carefully look at line by line, this will make you gain knowledge how replication system work under the hood!
