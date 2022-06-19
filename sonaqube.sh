#!bin/bash

#Author : Lynn
#Date: 6-19-2022


if
[ $UID -ne 1000 ]

then
echo" You must be in vargant to run this"
exit 2
fi

#Java installation
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y

#Download SonarQube
echo "check to make sure that tou have wget downloaded, if not download wget"
sleep 3

sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

#Extract packages
sudo unzip /opt/sonarqube-9.3.0.51899.zip

#connect to SonarQube
sudo systemctl start firewalld
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload

echo "open your browser and input your ip address in this format- http://<your-ip-address>:9000"
echo "This is the username and password for sonaqube"
echo "Displaying the username"
sleep 2
echo "Login: admin"
sleep 2
echo "displaying the password"
sleep 2
echo "password: admin"