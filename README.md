
# Install influx CLI

```
wget https://dl.influxdata.com/influxdb/releases/influxdb_client_2.0.0-rc.2_linux_amd64.tar.gz
tar xvfz influxdb_client_2.0.0-rc.2_linux_amd64.tar.gz
chmod u+x influx
sudo cp influx /usr/local/bin
```

# convert date in LibreOffice calc to UNIX epoch time
```
=(D2- 25569) * 86400
```

# Load cvs data
```
$ influx write dryrun -p s -b funds -f gbi-global-govies.csv
$ influx write -p s -b funds -f gbi-global-govies.csv
```
