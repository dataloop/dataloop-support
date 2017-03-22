_**PLEASE NOTE:** We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything._

## Command Line Interface

On Linux you can simply type `dataloop-agent` or call directly from `/usr/bin/dataloop-agent`

On Windows you can run:

`C:\Dataloop\embedded\bin\python.exe C:\Dataloop\agent\agent.py`

Run the `dataloop-agent` command with the `-h` argument to show the full help

```
# dataloop-agent -h
usage: dataloop-agent [-h] [--config PATH] -a KEY [-t START_TAGS] [-s]
                      [--name NAME] [-v]
                      {tags,agent} ...

## DataLoop.io Agent

optional arguments:
  -h, --help            show this help message and exit
  --config PATH         optional: path to config yaml file
  -a KEY, --api-key KEY
                        required: your agent api-key. This can be found in the
                        app
  -t START_TAGS, --tags START_TAGS
                        optional: start agent with tags
  -s, --solo            optional: run from a local plugin source
  --name NAME           optional: set the agent name
  -v, --version         show program's version number and exit

cli:
  {tags,agent}          CLI commands
    tags                update agent tags
    agent               update agent details
```

You can also pass -h into the options:

```
# dataloop-agent tags -h
usage: dataloop-agent tags [-h] {list,add,remove,clear} ...

optional arguments:
  -h, --help            show this help message and exit

tags:
  {list,add,remove,clear}
                        tags commands
    list                list this agents tags
    add                 add tags to this agent
    remove              remove tags from this agent
    clear               clear all tags from this agent
```

The most common use for the CLI is for tagging either in automated scripts or in config management.

As an example, while the Dataloop (Outlyer) Agent is running, you can list what tags it is a member of and then modify them:

```
#> dataloop-agent tags list
all
riak
prod
tag1

#> dataloop-agent tags remove tag1

#> dataloop-agent tags list
all
riak
prod

#> dataloop-agent tags add tag2

#> dataloop-agent tags list
all
riak
prod
tag2
```
