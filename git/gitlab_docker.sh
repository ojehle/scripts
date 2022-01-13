export GITLAB_HOME=$(pwd)
mkdir config logs data
docker pull gitlab/gitlab-ce:latest
docker run --detach \
  --hostname gitlab \
  --publish 8443:443 --publish 8080:80 --publish 2222:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  gitlab/gitlab-ce


mkdir -p $GITLAB_HOME/data/backups
if [ -f $GITLAB_HOME/data/backups/recover_database.sh  ]; then
exit 0
fi
cat > $GITLAB_HOME/data/backups/recover_database.sh <<_XEOF 
gitlab-ctl stop
gitlab-ctl start postgresql
sleep 30
gitlab-ctl start 
gitlab-ctl stop puma
gitlab-ctl stop unicorn
gitlab-ctl stop sidekiq
#
#
# This command will overwrite the contents of your GitLab database!
export force=yes


gitlab-psql <<EOF
\c postgres
select pg_terminate_backend(pid) from pg_stat_activity where datname='gitlabhq_production';
drop database gitlabhq_production;
create database gitlabhq_production;
alter database gitlabhq_production owner to gitlab;
EOF
gitlab-psql <<EOF
\c gitlabhq_production
create schema gitlab_partitions_dynamic ;
create schema gitlab_partitions_static ;
alter schema gitlab_partitions_dynamic owner to gitlab;
alter schema gitlab_partitions_static owner to gitlab;
CREATE EXTENSION IF NOT EXISTS btree_gist;
CREATE EXTENSION IF NOT EXISTS pg_trgm;
EOF

gitlab-ctl stop
gitlab-ctl start
_XEOF

echo "copy backup files to /var/opt/gitlab/backups/"
echo "tar xvzf /var/opt/gitlab/backups/gitlab.cfg.tar.gz etc/gitlab/gitlab-secrets.json"
echo "tar xvzf /var/opt/gitlab/backups/gitlab.cfg.tar.gz etc/gitlab/gitlab.rb"
echo "restore   export force=yes; gitlab-rake gitlab:backup:restore"
echo "reconfigure  gitlab-ctl reconfigure"

