#/bin/bash

set -eu

sudo apt install openjdk-8-jdk

GRADLE_VERSION=7.4
wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp
sudo unzip -d /opt/gradle /tmp/gradle-${GRADLE_VERSION}-bin.zip
sudo ln -s /opt/gradle/gradle-${GRADLE_VERSION} /opt/gradle/latest

