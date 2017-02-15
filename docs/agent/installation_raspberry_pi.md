## Installation on Raspberry Pi

### Debian based Linux (Raspbian Jessie only for now)

* Import the apt repository gpg key

```
curl -s https://download.dataloop.io/pubkey.gpg | apt-key add -
```

* Add the Dataloop apt repository

```
echo 'deb https://download.dataloop.io/deb/ unstable main' > /etc/apt/sources.list.d/dataloop.list
```

* Install the dataloop agent

```
sudo apt-get update && sudo apt-get install dataloop-agent
```

* Update the /etc/dataloop/agent.yaml file with your API key

* Start the agent

```
sudo systemctl start dataloop-agent
```

* Set the agent to run on reboot

```
sudo systemctl enable dataloop-agent
```
