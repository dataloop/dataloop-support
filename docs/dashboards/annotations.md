# Annotations

You can post annotations into Dataloop via either the API or command line utility.

[API Docs](https://documenter.getpostman.com/view/505524/dataloop_public_api/2FyccR#annotations)

Annotations are posted into `streams`. These streams can then be switched on and off within the Dataloop dashboards page via the annotations drop down at the top.

## Curl

```
curl -X POST -H "Content-Type: application/json" \
-H "Authorization: Bearer {{your_api_key}}" \
-d '{"name": "name", "description": "description"}' \
"http://api.dataloop.io/v1/orgs/{{your_org}}/accounts/{{your_account}}/annotations/{{stream_name}}"
```

## Command Line

Setup the Dataloop command line utility ([dlcli]())

Post a new annotation for a new deployment.

```
dlcli push annotation deployments --name 'deployed micro-service-1' --description 'version 100'
```

Now in Dataloop browse to a dashboard and tick the `deployments` stream from the annotations drop down.

Annotations will then be visible on graph widgets and the details can be seen by hovering over the dot on the horizontal axis.

## Ansible

Create a handler to annotate Dataloop whenever you deploy some code to production. In our example we are posting the package name and version under the stream deployments which is configured in the url.

```
  handlers:
  - name: annotate_dataloop
    uri:
      url: https://app.dataloop.io/api/v1/orgs/{{ dataloop_org_name }}/accounts/{{ dataloop_account_name }}/annotations/deployments
      method: POST
      HEADER_Authorization: "Bearer {{ dataloop_api_key }}"
      body_format: json
      body: {"name": "{{ package }}", "description": "{{ version }}"}
      run_once: true
```

Then call `annotate_dataloop` with a notify on the task that does the package deployment.
Chef

## Chef

We have a Chef handler for posting annotations into Dataloop on every chef run.

<https://github.com/dataloop/dataloop-chef-handler>
