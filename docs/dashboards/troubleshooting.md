# Troubleshooting

Hovering over a widget will display some options in the top right corner.

The best way to troubleshoot a widget is to click the (i) button and confirm the metric, scope, sources and last update time.

If troubleshooting a plugin then try to run it on an agent in the scope specified on the widget to check that the correct data is being returned.

The Dataloop Agent sends plugin data back using the wall clock time of the computer it is running on. Ensure you are running NTP or similar otherwise widgets can display odd looking data.
