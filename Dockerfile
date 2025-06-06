FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Copy only the csproj file and restore
COPY PlatformService/PlatformService.csproj ./PlatformService/
WORKDIR /app/PlatformService
RUN dotnet restore

# Copy the rest of the source code
COPY PlatformService/. ./
RUN dotnet publish -c Release -o /app/out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "PlatformService.dll"]
