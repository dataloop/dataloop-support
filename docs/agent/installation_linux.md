## Installation on Linux

### Debian based Linux (Debian, Ubuntu etc)

* Import the apt repository gpg key
  
```
curl -s https://download.dataloop.io/pubkey.gpg | apt-key add -
```
  
* Add the Dataloop apt repository

```
echo 'deb https://download.dataloop.io/deb/ stable main' > /etc/apt/sources.list.d/dataloop.list
```

* Install the dataloop agent

```
sudo apt-get update && sudo apt-get install dataloop-agent
```

* Update the /etc/dataloop/agent.yaml file with your API key

* Start the agent

```
sudo service dataloop-agent start
```

* Set the agent to run on reboot

```
sudo update-rc.d dataloop-agent defaults
```

- - -
 

### Redhat based Linux (Redhat, Centos etc)

* Add the Dataloop yum repository

Paste the following into /etc/yum.repos.d/dataloop.repo

```
[dataloop]
name=Dataloop Agent
baseurl=https://download.dataloop.io/packages/stable/el$releasever/$basearch/
enabled=1
gpgcheck=0
```

* Install the Datalooop Agent

```
sudo yum install dataloop-agent
```

* Update the /etc/dataloop/agent.yaml file with your API key

* Start the Dataloop Agent service

```
sudo service dataloop-agent start
```

* Set the agent to run on reboot

```
sudo chkconfig --level 345 dataloop-agent on
```

- - -

### Suse based Linux

* Download the RPM

```
wget https://download.dataloop.io/suse/x86_64/dataloop-agent_latest-suse-x86_64.rpm
```

* Install it

```
sudo rpm -i dataloop-agent-1.1.18-1.x86_64.rpm
```

* Update the /etc/dataloop/agent.yaml file with your API key

* Start the Dataloop Agent service

```
sudo systemctl start dataloop-agent
```

* Set the agent to run on reboot

```
sudo systemctl enable dataloop-agent
```

- - - 

### Archlinux based Linux (x86_64)


* Download the PKG

```
wget https://download.dataloop.io/archlinux/dataloop-agent_latest-archlinux-x86_64.pkg.tar.xz
```

* Install it

```
pacman -U dataloop-agent-1.1.20-1-x86_64.pkg.tar.xz
```

* Update the /etc/dataloop/agent.yaml file with your API key

* Start the Dataloop Agent service

```
sudo systemctl start dataloop-agent
```

* Set the agent to run on reboot

```
sudo systemctl enable dataloop-agent
```

Alternatively you can make the package yourself by following the instructions at https://github.com/dataloop/dataloop-archlinux

 
- - - 

### Curl sudo bash installer (only recommended on test machines)

This essentially automates the above.

* Run the following command 

```
curl -s https://download.dataloop.io/setup.sh | sudo bash -s xxx
```

Where xxx is your API key that you would have been emailed on signup. Or you can log into the web interface and click 'Install New Agent' on the 'Setup Monitoring' page.
