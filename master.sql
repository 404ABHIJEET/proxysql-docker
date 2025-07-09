-- monitor user
CREATE USER 'monitor'@'%' IDENTIFIED BY 'monitor';
GRANT ALL PRIVILEGES ON *.* TO 'monitor'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- appuser
CREATE USER 'appuser'@'%' IDENTIFIED BY 'appuser';
GRANT ALL PRIVILEGES ON *.* TO 'appuser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- creating databases
CREATE DATABASE parakh_hpc_admin;
CREATE DATABASE parakh_hpc_state_ch;