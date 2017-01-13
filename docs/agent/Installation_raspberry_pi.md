## Debian based Linux (Raspbian Jessie only for now)

1. Import the apt repository gpg key

```
curl -s https://download.dataloop.io/pubkey.gpg | apt-key add -
```

2. Add the Dataloop apt repository

```
echo 'deb https://download.dataloop.io/deb/ unstable main' > /etc/apt/sources.list.d/dataloop.list
```

3. Install the dataloop agent

```
sudo apt-get update && sudo apt-get install dataloop-agent
```

4. Update the /etc/dataloop/agent.yaml file with your API key

5. Start the agent

```
sudo systemctl start dataloop-agent
```

6. Set the agent to run on reboot

```
sudo systemctl enable dataloop-agent
```
