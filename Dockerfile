# escape=`

FROM mcr.microsoft.com/dotnet/framework/runtime:4.8-windowsservercore-ltsc2019

RUN powershell.exe -Command `
  $ErrorActionPreference = 'Stop'; `
  `
  Add-WindowsFeature Web-Webserver, `
    Web-WebSockets, `
    Web-WHC, `
    Web-ASP, `
    Web-ASP-Net45

RUN curl -Lo hwc.exe https://github.com/cloudfoundry/hwc/releases/download/23.0.0/hwc.exe

ENV PORT=8080
EXPOSE 8080

WORKDIR /app

ENTRYPOINT ["C:\\hwc.exe"]