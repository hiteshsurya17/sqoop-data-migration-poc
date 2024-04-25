# add mysql connector jar to sqoop lib
# test reading mysql data from sqoop
bin/sqoop-eval --connect jdbc:mysql://localhost/test --username admin --password root --query "select * from t1;"

# migrate data from mysql to hdfs
bin/sqoop import --connect jdbc:mysql://localhost/test --username admin --password root --table test1 -m1 --target-dir test_folder2
#m1 is a mapper to increase parallelism there are more like m2 m3 ..

# import all tables from a database 
bin/sqoop import-all-tables --connect jdbc:mysql://localhost/test --username admin --password root -m1
# if a table is already migrated it wont migrate again 

# migrating data from mysql to hive 
# copy the hive common jar in hive lib to sqoop lib 
# if the table is already present in hdfs then sqoop does not migrate that table because 
# same in the case when migrating to hdfs since hive also stores the data in hdfs 
bin/sqoop import --connect jdbc:mysql://localhost/test --username admin --password root --table test1 --hive-table \
mysqltohive1 --create-hive-table --hive-import -m1
# use --create-table if you do not create this table in prior 

# migrating data from mysql to hbase
bin/sqoop import --connect jdbc:mysql://localhost/test --username admin --password root --table test1 --hbase-table \
mysqltohbase1 --column-family cf --hbase-row-key pid --hbase-create-table -m1

