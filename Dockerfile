FROM ubuntu

RUN apt-get update && apt-get install -y apache2


ADD new/  /var/www/html/

RUN chmod +rwx /var/www/html/

CMD apachectl -D FOREGROUND



#sudo service docker restart


#sudo docker kill $(docker ps -q) && sudo docker rm $(docker ps -a -q) 
#sudo docker build -t ubuntu:latest '/home/eoxys/Downloads/jenkins/'
#sudo docker run -it -d -p 80:80 ubuntu:latest

