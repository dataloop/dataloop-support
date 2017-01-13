# OpsGenie

## Setting up OpsGenie 

We have an official integration with OpsGenie. Instructions for how to set this up can be found here:

https://www.opsgenie.com/docs/integrations/dataloop-io-integration


## Optional Settings

You can pass in some additional details to OpsGenie via the optional fields as specified in the Developer Docs

https://www.opsgenie.com/docs/web-api/alert-api

One of the more common options may be to specify which teams to alert.

```
{
"apiKey: "your_opsgenie_api_key",
"teams" : ["operations", "developers"]
}
```
