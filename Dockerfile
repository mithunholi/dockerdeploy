FROM ubuntu

RUN sudo apt-get update && apt-get install -y apache2


ADD sudo new/  /var/www/html/

RUN sudo chmod +rwx /var/www/html/


CMD apachectl -D FOREGROUND



#sudo service docker restart


#sudo docker kill $(docker ps -q) && sudo docker rm $(docker ps -a -q) 
#sudo docker build -t ubuntu:latest '/home/eoxys/Downloads/jenkins/'
#sudo docker run -it -d -p 80:80 ubuntu:latest

