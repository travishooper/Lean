#
#   LEAN Docker Container 20200519
#   Cross platform deployment for multiple brokerages
#

# Use base system
FROM quantconnect/lean:foundation

MAINTAINER QuantConnect <contact@quantconnect.com>

RUN git clone https://github.com/QuantConnect/Lean.git && cd Lean && nuget restore QuantConnect.Lean.sln && msbuild QuantConnect.Lean.sln /verbosity:quiet

# Can override with '-w'
WORKDIR /Lean/Launcher/bin/Debug

ENTRYPOINT [ "mono", "QuantConnect.Lean.Launcher.exe" ]