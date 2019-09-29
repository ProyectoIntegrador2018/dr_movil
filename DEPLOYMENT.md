# Dr-movil

[![Maintainability](https://api.codeclimate.com/v1/badges/6413fb2d9ed1a3d8257e/maintainability)](https://codeclimate.com/github/ProyectoIntegrador2018/dr_movil/maintainability)

This proyect's objective is to help people better keep track of the different diseases
they may have. We mainly take into account any kind of hearth disease and diabetes.

### Pre-requisites

1. You need to install Docker Desktop, to do that go to: https://www.docker.com/products/docker-desktop, create an account
and download the software, once it's downloaded install Docker Desktop with the default configuration.
Note: to download Docker Desktop you need to create an account with Docker.

2. Clone this repository into your local machine
```bash
$ git clone git@github.com:ProyectoIntegrador2018/dr_movil.git
```
3. AWS access and secret key.

### Deployment
2. Fire up a terminal, navigate to the cloned git repo and run:
```bash
$ docker-machine create --driver amazonec2 --amazonec2-access-key AKI******* --amazonec2-secret-key 8T93C*******  aws-sandbox
```

3. (Optional) To make sure you created the instance correctly and it's active, run:
```bash
$ docker-machine ls -t "30"
```
Should look something like this:
```bash
NAME             ACTIVE   DRIVER         STATE     URL                         SWARM   DOCKER        ERRORS
aws-sandbox      *        amazonec2      Running   tcp://52.90.113.128:2376            v1.10.0
```

4. Once the ec2 instance has been created on AWS run:
```bash
$ docker-compose -f docker-compose.prod.yml up -d --build
```
Then:
```
% rails db:create
```
Followed by:
```
% rails db:migrate
```
