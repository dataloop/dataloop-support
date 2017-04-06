!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called `dataloop agent`, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

# Webhook

When adding an action to a rule you can select the webhook option. This is a great way to connect your alerts into other systems like Slack or iFTTT (if this then that).

To configure a webhook simply change the URL field and hit test. By default we send the payload as JSON but you can change the drop down to send encoded in the URL if the service you are sending to prefers that.

You can add additional fields to the payload in the 'Extra Payload' box. This can also be used to override any of the current fields that we send.

Finally, click the test button to verify your webhook is configured correctly.

## Example delivery 

```json
User-Agent: Dataloop
Content-Type: application/json
X-Dataloop-Event: alert-webhook

{
  "event": "alert",
  "rule": "All Sytems",
  "account": "noreply@outlyer.com",
  "triggers": [
    {
      "criteria": "hosts are reporting down",
      "sources": [
        {
          "name": "dataloop",
          "tags": [ "all" ],
          "timestamp": "Wed Dec 09 2015 15:21:20 GMT+0000 (GMT)"
        }
    }
  ],
  "text": "a formatted summary of the payload"
}
```

 
## Details 

* event: ["alert" | "recovered"]

* criteria: ["hosts are reporting down" | "check <plugin_name> is failing" | "<metric> above threshold of <threshold>"]

* text: will be picked up automatically by slack

* no triggers details when event is 'recovered'
