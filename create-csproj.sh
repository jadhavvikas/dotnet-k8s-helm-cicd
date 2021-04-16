#!/bin/sh
NAME=ml.vsacme.api

# Create the directory
mkdir $NAME
cd $NAME

# Create an ASP.NET Core WebAPI and NUnit 3 Test project
dotnet new webapi -n $NAME
dotnet new nunit -n $NAME.unit

# Create a solution file and add the projects
dotnet new sln -n $NAME
dotnet sln $NAME.sln add $NAME/$NAME.csproj
dotnet sln $NAME.sln add $NAME.unit/$NAME.unit.csproj