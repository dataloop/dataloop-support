
**PLEASE NOTE:** We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.


## Backup and Restore

You can backup and restore entire organizations, accounts or objects with the Dataloop Command Line Tool and a Linux backup server.

* Install the Dataloop Command Line Utility

```
pip install dlcli
```

* Create the file /etc/dataloop/dlcli.yaml and enter your details

```
---
account: default
key: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
org: acme-ltd
url: https://app.outlyer.com/api/v1
```

* Create a directory for your backups

```
mkdir /backup
```

* Create a private Git repo called 'dataloop', add deploy keys for the root user with push access and optionally add a webhook to notify a Slack channel. Then clone into /backup so you have /backup/dataloop as your local copy.

* Create a file called `dataloop-backup.sh` in `/usr/local/bin` with the following content

```
#!/usr/bin/env bash
cd /backup/dataloop
rm -fr /backup/dataloop/*
/usr/local/bin/dlcli --backupdir /backup/dataloop --settingsfile /etc/dataloop/dlcli.yaml backup org acme-ltd
git add .
git commit -m 'backup of acme-ltd org'
git push
```

Change the `acme-ltd` to whatever your `org` is called.

* Setup a cron to run the backup every 10 mins

```
*/10 * * * * /usr/local/bin/dataloop-backup.sh > /var/log/backup.log 2>&1
```
