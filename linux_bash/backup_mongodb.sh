dbuser=your_db_user
dbpassword=your_db_password
dbname=your_db_name
basedir=/your/backup/directory #ex) /home/backup
host=your_db_host #ex) 127.0.0.1
port=your_db_port #ex) 27017
filename=$basedir/`date +%y%m%d%H%M`

#backup using mongodumb
mongodumb -h$host --port$port -u$dbuser -p$dbpassword -d$dbname -o$filename

#delete old backup file -ctime option. current is 10days 
find $basedir -maxdepth 1 -type f -name * -ctime +10 -exec rm {} \;

#another delete methods 
#if there are more than 10 files, delete old ones.
set `ls $basedir -tr`

while [$# -gt 10 ]
do
  rm -rf $1
  set `ls $basedir -tr`
done
