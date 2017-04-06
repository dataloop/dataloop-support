!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called `dataloop agent`, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

## Installation on Raspberry Pi

Currently, only Debian based Linux (Raspbian Jessie) running on Raspberry PI 2's (armv7) is supported.

## Raspbian Jessie:

For the next 2 steps you must be logged in as root. You can do this via `su root`. If you don't know your password for root you can easily update it using the command `sudo passwd root` to set it.

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

**Note:** If you get the error 'E: The method driver /usr/lib/apt/methods/https could not be found' then you can easily install it using the command 'sudo apt-get install apt-transport-https'.

* Update the /etc/dataloop/agent.yaml file with your API key

* Start the agent

```
sudo systemctl start dataloop-agent
```

* Set the Dataloop (Outlyer) Agent to run on reboot

```
sudo systemctl enable dataloop-agent
```

* Access GPIO Pins (Optional)

For security, the Dataloop (Outlyer) Agent runs as the non-privileged 'dataloop' user. By default this user will not have access to the GPIO pins on your PI required for reading and writing to sensors attached to your PI. In order to allow your Dataloop (Outlyer) Agent plugins to work with GPIO you will need to add the dataloop user to the 'gpio' group on your PI. Please note this will allow anyone running scripts on your Dataloop (Outlyer) Agent to read and write to your GPIO memory bus! To add the 'dataloop' user to the 'gpio' group type the following command:

```
sudo adduser dataloop gpio
```

Make sure you restart the Dataloop Dataloop (Outlyer) Agent afterwards to ensure the Dataloop (Outlyer) Agent permissions are correct:

```
sudo systemctl restart dataloop-agent
```
