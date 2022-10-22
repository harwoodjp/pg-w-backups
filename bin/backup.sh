dir="backups/"
file="$(date +"%Y-%m-%d_%T").sql"
docker exec -it postgres pg_dump --schema public --inserts > $dir/$file
bucket="harwoodjp-sql-backups/archive"
aws s3 cp $dir/$file s3://$bucket/$file