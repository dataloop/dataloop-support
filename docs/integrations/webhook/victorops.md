# VictorOps

## Setting up VictorOps

Set the webhook URL in Outlyer to:

<https://alert.victorops.com/integrations/generic/20131114/alert/<YOUR_API_KEY_HERE\>/<ROUTING_KEY_HERE\>>

Hit the test button and you should get an incident triggered in VictorOps.

When the rule is resolved in Outlyer the webhook will fire again to resolve the incident in VictorOps automatically.

 

## Optional Settings

You can pass in some additional details to VictorOps via the optional fields as specified in the Developer Docs

<http://victorops.force.com/knowledgebase/articles/Integration/Alert-Ingestion-API-Documentation>
