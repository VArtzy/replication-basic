## Part 3: Advanced Topics & Troubleshooting (30 minutes)

### 3.1 Monitoring Replication
- MySQL: `SHOW SLAVE STATUS`
- PostgreSQL: `pg_stat_replication`
- MongoDB: `rs.status()`

### 3.2 Common Issues & Solutions
1. **Replication Lag**
   - Solution: Monitor `Seconds_Behind_Master` (MySQL), adjust hardware

2. **Conflict Resolution**
   - Solution: Implement application-level conflict handlers

3. **Network Issues**
   - Solution: Configure timeouts and retries

4. **Schema Drift**
   - Solution: Use schema synchronization tools

### 3.3 Performance Considerations
- Batch size for changes
- Network bandwidth
- Disk I/O capacity
- Monitoring overhead
