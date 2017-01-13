# Hipchat

## Setting up HipChat

Set the webhook URL in Dataloop to:

https://api.hipchat.com/v2/room/{room_id_or_name}/notification?auth_token=YOUR_TOKEN

Then in the Extra Payload box add the following:

```
{
"from": "Dataloop",
"message_format": "text"
}
```

Hit the test button and you should get a message in your HipChat room.

 

## Optional Settings

You can pass in some additional details to HipChat via the optional fields as specified in the Developer Docs

https://www.hipchat.com/docs/apiv2/method/send_room_notification
