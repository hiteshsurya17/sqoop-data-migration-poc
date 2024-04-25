# migrating data from hdfs to mysql 
# create a table in mysql to for target location and data in hdfs 
bin/sqoop export --connect jdbc:mysql://localhost/test --username admin --password root\
  --table name --export-dir /user/hive/warehouse/test.db/name.txt -m1

# migrating data from hive to mysql is almost same but you give path to a table in hdfs instead of a file
bin/sqoop export --connect jdbc:mysql://localhost/test --username admin --password root\
  --table name --export-dir /user/hive/warehouse/test.db/demo -m1
# sqoop export is very sensitive to data type, length mismatch issue. so plese be carefult an check 
# these datatypes match
