CREATE USER 'repl'@'%' IDENTIFIED WITH mysql_native_password BY 'replpass';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;

-- Optional test table
USE testdb;
CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY, name VARCHAR(100));