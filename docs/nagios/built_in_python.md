# Built-In Python Interpreter

When creating or editing a Nagios plugin you can select the shell to use when executing the script from the drop down. The default is 'system default' which means scripts get executed as if you ran them from the command line on the server. On Linux this means whatever you have set the shebang to.

'Built-In Python' is a shell we ship with the agent. This is a statically compiled Python 2.7 interpreter with a whole bunch of libraries baked in. When you select this we will always run the contents of your script using this interpreter.

Here are a list of libraries currently enabled.

```
###
# Core Agent dependencies. These are require for the Agent to run
###
APScheduler==3.0.3
netifaces==0.10.4
nose==1.3.7
psutil==4.3.0
pytz==2016.10
PyYAML==3.11
requests==2.12.3
websocket-client==0.37.0
```

```
##
##
# Plugin dependencies. These are required to run the out of the box plugins
##
backports.ssl-match-hostname==3.4.0.2
BeautifulSoup==3.2.1
boto==2.23.0
boto3==1.4.0
cffi==1.7.0
cryptography==1.4
dlcli==0.3.6
docker-py==1.9.0
gevent==1.0.2
grequests==0.3.0
google-api-python-client==1.4.0
jenkinsapi==0.2.22
meld3==1.0.0
mock==1.0.1
MySQL-python==1.2.5
nagioscheck==0.1.6
nagiosplugin==1.2.2
oauth2client==1.5.2
pexpect==4.0.1
pg8000==1.10.1
pika==0.9.14
psycopg2==2.6
pycparser==2.14
pyjolokia==0.3.1
pymongo==2.6.3
pynag==0.9.1
pynagios==0.1.1
pyOpenSSL==0.14
pysnmp==4.2.5
pyvmomi==5.5.0.2014.1.1
redis==2.10.3
rethinkdb==2.2.0.post6
robobrowser==0.5.3
six==1.10.0
splunk-sdk==1.3.1
testinfra==1.0.2
xmltodict==0.9.0
```

You can add additional libraries on the server by running pip from the embedded interpreter bin folder.

On Linux:

```
/opt/dataloop/embedded/bin/pip install <module>
```

On Windows:

```
c:\dataloop\embedded\bin\pip.exe install <module>
```

If you contact us at support@dataloop.io you can request we bundle other libraries.
