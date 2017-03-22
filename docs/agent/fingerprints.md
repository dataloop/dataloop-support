_**PLEASE NOTE:** We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything._

## Fingerprints

When an Agent starts for the first time on a new server it creates an agent.finger file (in `/etc/dataloop` on Linux boxes and `C:\Dataloop` on Windows). This is used to uniquely identify the Agent.

Deleting the `agent.finger` file and restarting the service will cause the Dataloop (Outlyer) Agent to generate a new identity and it will lose its old metrics.

Conversely, starting servers with known fingerprint files allows you to connect new boxes to existing metrics which is extremely useful for dynamically changing environments where configuration management tools are used.

## Example

You may have an environment made up of 6 different server roles.  
Each role is scaled up to 10 servers.  
Your deployment mechanism may mean that every server gets recycled every few days as features are released.  
You may decide to store two fingerprints for each role in your configuration management system so that 2 / 10 of the nodes rejoin their old metrics.  
The remaining 8 servers per role get a new identify each time.  
In this way you can look back across many releases to determine what effects the changes have had on your service.
