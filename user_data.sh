#!/bin/bash

# install java
sudo apt-get update
sudo apt install openjdk-11-jre

# install jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get install fontconfig openjdk-11-jre
sudo apt-get install jenkins


# install python
sudo apt-get install python3.6

