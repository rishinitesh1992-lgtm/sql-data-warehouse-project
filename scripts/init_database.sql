This script creates a new database named DataWarehouse after checking it properly. If the database exists, it is dropped and recreated. Additionally, the scripts set up three schemas within the database: Gold, Silver: Bronze.

  create database Datawarehouse;

create schemas

create schema bronze
go
create schema silver
go
create schema gold;
