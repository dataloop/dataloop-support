# Alert Rules

Alert rules are comprised of **criteria** and **actions**. It is recommended that all rules be created based on tags and that criteria for a given service are grouped together based on severity.

* Example: The rule 'ElasticSearch Warning' may contain criteria that need attention but wouldn't necessarily wake anyone up. The actions for this rule would email a group and send a webhook to Slack. Whereas the 'ElasticSearch Critical' rule would contain a few critical checks, such as service down and would send a webhook to PagerDuty.

Criteria are made up of a scope, the metric to alert on and options like comparator, duration and threshold.

Supported actions include sending an email or a webhook. When a webhook is configured for a supported integration (listed under the Integrations section of the support docs) we detect the url and send additional fields.

If multiple criteria are created within a rule then **ANY** need to be met before the rule is triggered and **ALL** actions are run.

Outlyer rules are very flexible, to the point where you can shoot yourself in the foot if you choose to do so.

* Example: You can create a plugin to monitor a service and apply it to one tag of agents. Then configure a criteria to alert on that same plugin using a different tag that only contains a subset of agents that the plugin is deployed to. For this reason we have defined a simple traffic light system to help uncover mistakes in setup.

## Criteria and Rule status

You can view the overall health of rules in the alerts page in Outlyer. Each rule is colour coded as per the table below. To be confident that you have effective alerting setup the aim should be to keep all rules in a green state.

| Colour  | State       |
|:--------|:------------|
| Green   | Clear       |
| Orange  | Pending     |
| Grey    | Unknown     |
| Red     | Triggered   |

When a criteria is defined in Outlyer, a query is added to a background set of workers that poll every 10 seconds and compare desired state to current state.

If a complete set of data is returned for **all** criteria in a rule and all checks pass then a criteria is considered clear. If all criteria within a rule are clear then the rule is clear.

Pending is the transitional state between Clear and Triggered. A criteria will stay pending for the duration specified.

* Example: A criteria duration is set to 5 minutes and a problem occurs the criteria will switch from green to orange within 10 seconds and then stay pending for 5 minutes before turning red. The same is true when a problem is fixed. The criteria will change from red to orange and stay pending for 5 minutes before turning green.

A rule will appear red if **any** criteria within it are red.

A rule will appear grey if **any** of the criteria are not receiving data, of if the rule contains no criteria.

When evaluating the order of state both within criteria and for criteria within rules we use the following matrix.

|               |unknown       | clear       | triggered    |
|--------------:|--------------|-------------|--------------|
| **unknown**   | _unknown_    | _unknown_   | _triggered_  |
| **clear**     |  _unknown_   | _clear_     |  _triggered_ |
| **triggered** |  _triggered_ | _triggered_ |  _triggered_ |

This means that a triggered criteria will always turn a rule red. Also, that unknown criteria will always turn a rule grey (in the absence of any triggered criteria).

## Alert Lifecycle

For a rule that is currently **green** the only state change possible is to change to **grey** if any of the criteria stop returning data for any defined metric path. Or, alternatively, it may turn **red** if a Dataloop (Outlyer) Agent or plugin changes status or a threshold is met.

Actions are run when state changes to **red** with a message beginning `ALERT:` which signifies the start of an incident. Integration fields are configured in such a way that this will create a unique new incident.

When a rule is red, but criteria within it change state, the actions are triggered again with a message beginning `UPDATE:` which signifies that something has changed (either got better or worse). These are correlated with supported integrations so that updates append additional information to the open incident, and don't create new incidents.

When a rule is either grey or red it may change state to green. On state change to green the actions are triggered with a message beginning `RESOLVED:`. This signifies the end of the incident and supported integrations are configured to automatically close the incident.

It is worth noting that a rule that has criteria not receiving data will never send a resolved email or webhook. However, changes to criteria within a grey rule will still send update notifications. It is recommended that an effort is made to keep all rules in a green state.
