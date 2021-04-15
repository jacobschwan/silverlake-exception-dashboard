# Silverlake Exception Dashboard
A Shiny Flexdashboard to view logged exceptions during a conversion to [Jack Henry & Assoc.](http://www.jackhenry.com) Silverlake product.

## Usage

Set the environment variables for your Silverlake host, library, user, password, and optional bank number. Ask your the manager of your core implementation for these.  Once the container is up and running you can view the dashboard at http://localhost:3838. 

Here are some example snippets to help you get started creating a container.

### docker-compose ([recommended](https://docs.docker.com/compose/))

```yaml
---
version: '3'

services:
   sl-exception-dashboard:
     image: jmschwan/silverlake-exception-dashboard
     container_name: sl-exception-dashboard
     ports:
       - "3838:3838"
     environment:
       - AS400HOST=<FQDN or IP Address>
       - AS400LIB=INSCOM000          
       - AS400USER=<unsername>
       - AS400PWD=<password>
       - TZ="America/Chicago"
       - BANKNUM=000
       - DEFAULT_TRIP=<tripnum>
     restart: unless-stopped
```
### docker cli

```
docker run -d \
   --name=sl-exception-dashboard \
   -e AS400HOST=<FQDN or IP Address> \
   -e AS400LIB=INSCOM000 \
   -e AS400USER=<unsername> \
   -e AS400PWD=<password> \
   -e TZ="America/Chicago" \
   -e BANKNUM=000 \
   -e DEFAULT_TRIP=<tripnum> \
   -p 3838:3838 \
   --restart unless-stopped \
   jmschwan/silverlake-exception-dashboard
```

## Environment Variables

The dashboard uses the following environoment variables to connect to your Silverlake instance.

| Variable | Description |
| :------  | ----------- |
| `AS400HOST` | IP address or fully qualified domain name of your Silverlake instance|
| `AS400LIB`  | Library where the EXCEPT table exists for your implementation. This is likely INSCOM plus your bank number, e.g. `INSCOM000`|
| `AS400USER` | User setup with query access to the `AS400LIB` |
| `AS400PWD`  | Password for `AS400USER` |
| `BANKNUM`   | Optional. Your bank number to be displayed in the dashboard title.|
| `TZ`        | Timezone as compatible with R. See [timezones](https://stat.ethz.ch/R-manual/R-devel/library/base/html/timezones.html) documentation. |
| `DEFAULT_TRIP` | Optional. Trip number the dashboard should default to, e.g. T2 |
