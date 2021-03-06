

-- BEGIN generate DDL --

DROP DATABASE IF EXISTS mg;

CREATE DATABASE mg;

DROP USER IF EXISTS mg_rw@'%';

CREATE USER mg_rw@'%' IDENTIFIED BY 'mg_rw_password';

GRANT SELECT,INSERT,DELETE,UPDATE ON mg.* TO mg_rw@'%' WITH GRANT OPTION;

DROP USER IF EXISTS mg_ro@'%';

CREATE USER mg_ro@'%' IDENTIFIED BY 'mg_ro_password';

GRANT SELECT ON mg.* TO mg_ro@'%' WITH GRANT OPTION;

USE mg;

CREATE TABLE account_statistics (
  id BIGINT AUTO_INCREMENT NOT NULL,
  createdAt BIGINT NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;


CREATE TABLE spot_account_snapshots (
  id BIGINT AUTO_INCREMENT NOT NULL,
  createdAt BIGINT NOT NULL,
  snapshotAt BIGINT NOT NULL,
  userId BIGINT NOT NULL,
  balance DECIMAL(36,18) NOT NULL,
  currency VARCHAR(32) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;


CREATE TABLE operation_logs (
  id BIGINT AUTO_INCREMENT NOT NULL,
  createdAt BIGINT NOT NULL,
  managerId BIGINT NULL,
  type VARCHAR(50) NULL,
  managerName VARCHAR(255) NULL,
  message VARCHAR(255) NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;


CREATE TABLE withdraw_audits (
  id BIGINT AUTO_INCREMENT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;


CREATE TABLE order_statistics (
  id BIGINT AUTO_INCREMENT NOT NULL,
  createdAt BIGINT NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;


CREATE TABLE managers (
  id BIGINT AUTO_INCREMENT NOT NULL,
  createdAt BIGINT NOT NULL,
  updatedAt BIGINT NOT NULL,
  version BIGINT NOT NULL,
  email VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
  random VARCHAR(50) NOT NULL,
  passwd VARCHAR(100) NOT NULL,
  permissions VARCHAR(1000) NOT NULL,
  PRIMARY KEY(id)
) Engine=INNODB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;

-- END generate DDL --
