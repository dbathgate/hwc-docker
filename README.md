# HWC Docker Container

## Overview

* Uses a [Hosted Web Core wrapper](https://github.com/cloudfoundry/hwc) that was initially built for CloudFoundry in a Docker container 
* [Hosted Web Core](https://learn.microsoft.com/en-us/iis/web-development-reference/native-code-development-overview/walkthrough-creating-a-hosted-web-core-application) is a feature of windows for embedding an instance of IIS inside an application

## Why

* The standard [ASP.NET container](https://github.com/microsoft/dotnet-framework-docker/blob/main/src/aspnet/4.8/windowsservercore-ltsc2019/Dockerfile) provided by Microsoft does not output application logs written to `STDOUT` and therefore not [12-factor compliant](https://12factor.net/logs)

## Usage

```bash
docker build -t hwc-base .
```

```dockerfile
FROM hwc-base

ADD MyApp/bin/app.publish /app
```

