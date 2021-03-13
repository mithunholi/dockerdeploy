#!/bin/sh

while true
do 

dir=$(inotifywait -r -e create,modify /home/ubuntu)
echo "the dirname is"
echo $dir
folderName=${dir#"/home/ubuntu/ CREATE,ISDIR "}
echo "The folderName is"$folderName

type=${dir#"/home/ubuntu/ "}
type=${type%",ISDIR "}
echo "the type is "$type
done
if type=="CREATE"
then
sudo docker build -t $folderName --build-arg fileName=$folderName .
sudo docker tag $folderName ecmithun/$folderName
sudo docker login -u "ecmithun" -p "mithun@1234" docker.io
sudo docker push ecmithun/$folderName
elif type=="MODIFY"
then
sudo docker build -t $folderName:latest --build-arg fileName=$folderName .
sudo docker tag $folderName ecmithun/$folderName:latest
sudo docker login -u "ecmithun" -p "mithun@1234" docker.io
sudo docker push ecmithun/$folderName:latest
fi





FROM nginx
ARG fileName
RUN echo $fileName
ADD $fileName/ /usr/share/nginx/html
