CREATE LOGIN ${db.user} WITH PASSWORD = '${db.password}';
CREATE USER ${db.user} FOR LOGIN ${db.user};