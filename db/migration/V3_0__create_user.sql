CREATE LOGIN ${db_user} WITH PASSWORD = '${db_password}';
CREATE USER ${db_user} FOR LOGIN ${db_user};