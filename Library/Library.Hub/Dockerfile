#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.


FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build
WORKDIR /src

COPY . .
WORKDIR "/src/Library.Hub"

ARG CONFIG_PROFILE

RUN dotnet restore

FROM build AS publish
RUN dotnet publish "Library.Hub.csproj" -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "Library.Hub.dll"]