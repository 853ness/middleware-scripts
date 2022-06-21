sudo yum update -y
sudo yum install java-11-openjdk-devel* -y
sudo yum install java-11-openjdk -y

if
[ $? -ne 0 ]
then echo "You failed to install java"
echo "please try again"
exit 1
fi

sudo yum install wget -y


##================> installing sonaqube <===============
sudo yum install unzip
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip -P /opt
sudo unzip /opt/sonarqube-9.3.0.51899.zip -d /opt

##=============> Adjusting the user permission <========

sudo chown -R $USER:$USER /opt/sonarqube-9.3.0.51899
sudo sed -i 's/#RUN_AS_USER=/RUN_AS_USER=$USER/g' /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh
sudo chmod +x /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh
sudo /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh start
sudo /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/sonar.sh status
##===========> In case you need to adjust your firewall<=============

#sudo systmectl start firewalld
#sudo firewall-cmd --permanent --add-port=9000/tcp
#sudo firewall-cmd --reload
