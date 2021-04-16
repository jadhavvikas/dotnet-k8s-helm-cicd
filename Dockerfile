FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS BUILD

# Copy the source code into the project directory
WORKDIR /project
COPY . .

# Build a production version of the application
RUN dotnet restore && \
    dotnet publish --no-restore -c Release -o /project/output
WORKDIR /project/output

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS DEPLOY

# Copy the build output into the deployment directory
WORKDIR /app
COPY --from=BUILD /project/output .

# Entrypoint and network configuration
EXPOSE 80
ENTRYPOINT ["dotnet", "ml.playground.api.dll"]