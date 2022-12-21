FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build
WORKDIR /src

COPY . .
WORKDIR "/src/Library.Books.Api"

RUN dotnet restore

FROM build AS publish
RUN dotnet publish "Library.Books.Api.csproj" -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "Library.Books.Api.dll"]


