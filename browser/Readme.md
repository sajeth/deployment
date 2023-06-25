1) docker build -t browser-service:SPECIFIED_VERSION .
2) docker tag browser-service:SPECIFIED_VERSION public.ecr.aws/g9t4u5w2/browser-service:latest:SPECIFIED_VERSION
3) docker push public.ecr.aws/g9t4u5w2/browser-service:SPECIFIED_VERSION




sudo yum update -y

sudo amazon-linux-extras install docker

sudo service docker start

sudo systemctl start docker

sudo service docker status

sudo groupadd docker

sudo usermod -a -G docker ec2-user

newgrp docker

docker pull public.ecr.aws/g9t4u5w2/browser-service:114.0

docker run -d -p 4444:4444 -p 7900:7900 --shm-size="2g" public.ecr.aws/g9t4u5w2/browser-service:114.0