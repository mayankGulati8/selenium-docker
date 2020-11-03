FROM openjdk:8u191-jre-alpine3.8

#Need to install jq and curl since in above image it doesnt support the same
RUN apk add curl jq

#Workspace
WORKDIR /usr/share/udemy

#ADDING FILES AS REQUIRED
ADD target/selenium-docker.jar selenium-docker.jar
ADD target/selenium-docker-tests.jar selenium-docker-tests.jar
ADD target/libs libs
#In case of any other dependency like .csv/ .json / .xls , please add that as well

#Add suite files
ADD testng.xml testng.xml
ADD testngduck.xml testngduck.xml
ADD healthcheck.sh healthcheck.sh

ENTRYPOINT sh healthcheck.sh