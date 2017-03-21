# Powershell

You can create native Powershell plugins in Outlyer by creating a custom shell and ensuring your Powershell code exits correctly. 

Open the Settings page in your account and create a new shell called 'Powershell' with the path set to:

```
C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe -executionpolicy bypass -File
```

When creating plugins ensure they have the .ps1 extension set and change the shell on the details page to 'Powershell'.

When writing Powershell plugins please use the following function to set the exit code correctly so that Outlyer gets the correct code returned.

```
function ExitWithCode
{
    param
    (
        $exitcode
    )  
    $host.SetShouldExit($exitcode)
    exit
}
```

Then wherever you would usually exit use ExitWithCode instead. This will enable passing of the standard nagios exit codes 0,1,2 and 3 back to Outlyer for use in dashboard status widgets and alerts.

You can also use arguments by updating the shell arguments on the plugins details page. For example if you set:

```
-arg1 123 -arg2 456
```

As the shell arguments on a plugin. You can then reference them in your Powershell script by first definining them as params 

```
[CmdletBinding()]
Param
(
    [string]$arg1,
    [string]$arg2
)
```

Then referencing the arguments in your scripts with `$arg1` and `$arg2` or whatever you name your arguments.
