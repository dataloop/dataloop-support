## Private Packs

Private packs can be used to keep your custom plugins, dashboards and alert rules locked together as a single versioned entity within Dataloop.

They are designed to be small containers of monitoring configuration that can be shared around between accounts.

Currently private packs can only be managed with the Dataloop command line utility (dlcli). We will be adding private pack management to the UI soon

### Terminology:

* Pack: The installed entity
* Template: The entity that can be installed from, that creates a pack in the account

### Create a new pack

In our example we'll create a pack called microservice1. Names must be unique and friendly, ideally something that matches the service the pack will monitor. When used with autodiscovery the pack name is also used to tag agents.

```
dlcli create pack microservice1
```

This should create a new directory on disk with the following structure:

```
.
├── README.md
├── dashboards
│   └── microservice1.yaml
├── package.yaml
├── plugins
│   └── microservice1.py
└── rules
    └── microservice1.yaml
```

You can now start to populate this structure with the content created in the Dataloop UI by copying and pasting the plugin content and pressing export to yaml on the dashboards and rules pages. Or alternatively by using the dlcli pull commands. You may also want to update the pack metadata file package.yaml with additional information.

Once you have finished editing your pack locally it's time to upload it into Dataloop as a Template that can be installed.

To upload the pack as a Template in Dataloop run the following command from inside the pack directory:

```
dlcli push template microservice1 .
```

Once the pack is pushed you can check it is there by running:

```
dlcli get templates
```

Assuming you are happy to install the pack you can now run

```
dlcli install template microservice1
```

To uninstall the pack at a later date simply run

```
dlcli rm pack microservice1
```

To delete the template run:

```
dlcli rm template microservice1
```

**Note**: Installing a template results in a tag being created that matches the pack name. You can therefore tag your agents with the same name as the pack and on install a link will automatically be created.

### Troubleshooting

You can show the contents of a template by running:

```
dlcli get template microservice1
```

Where `microservice1` is the name of the template you wish to inspect
