# Grafana

## Grafana 3.0 Plugin

You can add a Dataloop agent as a datasource in Grafana by following these instructions. This is especially useful when used with a StatsD server. Install a Dataloop agent on the StatsD server and use the fingerprint to view all of your StatsD metrics in Grafana.

1. Install Grafana 3.0

http://docs.grafana.org/installation/

2. Add the Dataloop data source

```
cd /var/lib/grafana/plugins
```

git clone https://github.com/dataloop/dalmatinerdb-datasource dalmatinerdb

3. Restart the grafana-server service

```
sudo service grafana-server restart
```

4. Create an API token

Login into Dataloop and click account settings in the top right corner. Then generate an API token. You may want to create a service user account to restrict access to certain metrics in Grafana. 

5. Create a new Data source in Grafana as per below

![Grafana Datasource](../img/grafana_datasource.png)

    * Name: Dataloop
    * Type: DalmatinerDB
    * URL: https://grafana.dataloop.io
    * Access: proxy
    * Auth Token: Ticked, and use the API token from step 4

**Note**: Wildcards in metric paths only currently work within a single fingerprint. This is not a problem for dimensional data (coming from Prometheus plugins) but is required for StatsD. Therefore to use wildcards in metric paths you must always specify a dl:source in the WHERE clause.

![Grafana Wildcard](../img/grafana_wildcard.png)
