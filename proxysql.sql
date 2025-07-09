-- updating monitor username and password
UPDATE global_variables SET variable_value='monitor' WHERE variable_name='mysql-monitor_username';
UPDATE global_variables SET variable_value='monitor' WHERE variable_name='mysql-monitor_password';
LOAD MYSQL VARIABLES TO RUNTIME;
SAVE MYSQL VARIABLES TO DISK;

-- entries of mysql servers in server table
INSERT INTO mysql_servers (hostgroup_id, hostname, port, comment) 
VALUES (10, 'mysql-master', 3306, 'admin_master'); 
INSERT INTO mysql_servers (hostgroup_id, hostname, port, comment) 
VALUES (11, 'mysql-replica1', 3306, 'admin_replica1'); 
INSERT INTO mysql_servers (hostgroup_id, hostname, port, comment) 
VALUES (11, 'mysql-replica2', 3306, 'admin_replica2'); 
INSERT INTO mysql_servers (hostgroup_id, hostname, port, comment) 
VALUES (20, 'mysql-master', 3306, 'ch_master'); 
INSERT INTO mysql_servers (hostgroup_id, hostname, port, comment) 
VALUES (21, 'mysql-replica1', 3306, 'ch_replica1'); 
INSERT INTO mysql_servers (hostgroup_id, hostname, port, comment) 
VALUES (21, 'mysql-replica2', 3306, 'ch_replica2'); 

LOAD MYSQL SERVERS TO RUNTIME;
SAVE MYSQL SERVERS TO DISK;

-- entry of user in user table
INSERT INTO mysql_users (username, password, default_hostgroup) 
VALUES ('appuser', 'appuser', 10);

LOAD MYSQL SERVERS TO RUNTIME;
SAVE MYSQL SERVERS TO DISK;

-- entries of replication hostgroup
INSERT INTO mysql_replication_hostgroups (writer_hostgroup, reader_hostgroup, check_type, comment)
VALUES (10, 11, 'read_only', 'parakh_hpc_admin');
INSERT INTO mysql_replication_hostgroups (writer_hostgroup, reader_hostgroup, check_type, comment)
VALUES (20, 21, 'read_only', 'parakh_hpc_state_ch');

LOAD MYSQL SERVERS TO RUNTIME;
SAVE MYSQL SERVERS TO DISK;

-- entries of query rules for routing
INSERT INTO mysql_query_rules (rule_id, active, schemaname, match_pattern, destination_hostgroup, apply, comment) 
VALUES (1, 1, 'parakh_hpc_admin', '^SELECT', 11, 1, 'admin_read');
INSERT INTO mysql_query_rules (rule_id, active, schemaname, match_pattern, destination_hostgroup, apply, comment) 
VALUES (2, 1, 'parakh_hpc_state_ch', '^SELECT', 21, 1, 'ch_read');
INSERT INTO mysql_query_rules (rule_id, active, schemaname, match_pattern, destination_hostgroup, apply, comment) 
VALUES (3, 1, 'parakh_hpc_admin', '^(INSERT|UPDATE|DELETE|REPLACE|CREATE)', 10, 1, 'admin_write');
INSERT INTO mysql_query_rules (rule_id, active, schemaname, match_pattern, destination_hostgroup, apply, comment) 
VALUES (4, 1, 'parakh_hpc_state_ch', '^(INSERT|UPDATE|DELETE|REPLACE|CREATE)', 20, 1, 'ch_write');

LOAD MYSQL QUERY RULES TO RUNTIME;
SAVE MYSQL QUERY RULES TO DISK;

