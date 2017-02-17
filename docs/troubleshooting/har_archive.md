## Generating an HTTP Archive (HAR) file


If you report problems with a page on our site, we may ask you to send us a HAR file for debugging. HAR stands for the HTTP Archive file format. A HAR file logs all of your browser's interactions with our site. It can help us to diagnose and resolve certain types of issues:

* Performance: slow page load, timeout when performing certain task
* Page rendering: incorrect page format, missing information
How you generate a HAR file depends on the browser you are using. Please choose your browser from the list below. If you do not see your browser listed, please contact us for assistance.


### Chrome

Google Chrome includes the Developer Tools, which can generate HAR files.

![Chrome HAR](/img/chrome_har.png)

Bring up the developer tools by clicking the Chrome menu in the top right corner of your browser window, then selecting More Tools > Developer Tools.
Navigate to the Network tab.
Check Disable Cache to force all content to be loaded from the server.
Refresh the page to start capturing the traffic from the browser to the server.
Complete the steps that trigger or demonstrate your issue. For example, if a certain dashboard is slow, click on the dashboard and wait for it to completely load.
Right-click in the DevTool window and select Save as HAR with content.
 

### Firefox

![Firefox HAR](/img/ff_har.png)

Bring up the Developer Tools by clicking the Firefox Menu button, then selecting Developer > Network.
Refresh the page to start capturing the traffic between the browser to the server.
Complete the steps that trigger or demonstrate your issue. For example, if a certain dashboard is slow, click on the dashboard and wait for it to completely load.
Right-click in the Development Tool window and select Save All As HAR.
 

### Internet Explorer

Internet Explorer is not a browser supported for use with Dataloop.


