# BigPanda

## Setting up BigPanda

Set the webhook URL in Dataloop to:

https://api.bigpanda.io/data/v2/alerts?access_token=<YOUR TOKEN>

Then in the Extra Payload box add the following:

```
{
"app_key": "your_bigpanda_app_key"
}
```

Hit the test button and you should get an incident triggered in BigPanda.
 

## Optional Settings

You can pass in some additional details to BigPanda via the optional fields as specified in the Developer Docs

https://www.bigpanda.io/docs/display/BD/POST+alerts

 
