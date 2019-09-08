# Nombre del proyecto

Dr Movil

## Table of contents

* [Client Details](#client-details)
* [Environment URLS](#environment-urls)
* [Da Team](#team)
* [Management resources](#management-resources)
* [Setup the project](#setup-the-project)
* [Running the stack for development](#running-the-stack-for-development)
* [Stop the project](#stop-the-project)
* [Restoring the database](#restoring-the-database)
* [Debugging](#debugging)
* [Running specs](#running-specs)
* [Checking code for potential issues](#checking-code-for-potential-issues)


### Client Details

| Name                  | Email                   | Role |
| --------------------- | ----------------------- | ---- |
| Dr.José Luis Gonzáles | med.gonzalezg@gmail.com | CEO  |


### Environment URLS

* **Production** - [TBD](TBD)
* **Development** - [TBD](TBD)

### Da team

| Name                           | Email                    | Role                                       |
| ------------------------------ | ------------------------ | ------------------------------------------ |
| Rubén Humberto Garza Hernández | rubengarzah@hotmail.com  | Proyect configuration admin & proyect Admin|
| Luis Carlos Figueroa Rodríguez | lc.figueroar26@gmail.com | Product Owner Proxy                        |
| Luis Salomón Flores Ugalde     | a00817435@itesm.mx       | SCRUM Master                               |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/)
* [Backlog]()
* [Heroku](https://crowdfront-staging.herokuapp.com/)
* [Documentation](https://drive.com)

## Development

### Setup the project

You need to install Docker Desktop, to do that go to: https://www.docker.com/products/docker-desktop, create an account
and download the software, once it's downloaded install Docker Desktop with the default configuration.
Note: to download Docker Desktop you need to create an account with Docker.

After installing please you can follow this simple steps:

1. Clone this repository into your local machine

```bash
$ git clone git@github.com:ProyectoIntegrador2018/dr_movil.git
```

2. Fire up a terminal and run:

```bash

$ docker-compose up -d --build app
```

3. Inside the container you need to create & migrate the database:
To get into the bash of the application:
```bash
$ docker-compose exec app bash
```
Then: (optional, depends if you've created the DB before)
```
% rails db:create
```
Followed by:
```
% rails db:migrate
```
Finally you can seed the db with:
```
% rails db:seed
```
### Running the stack for Development

1. Fire up a terminal and run:

```
docke-compose up -d --build app
```

That command will lift every service the app needs, such as the `rails app server` and `postgres`.


It may take a while before you see anything, you can follow the logs of the containers with:

```
$ docker-compose logs
```

Once you see an output like this:

```
Removing intermediate container 3b6fe9c6dc59
 ---> 6758c472bd1a
Step 8/10 : COPY . .
 ---> ee08267018aa
Step 9/10 : EXPOSE 80
 ---> Running in 22fa9e3f6cb1
Removing intermediate container 22fa9e3f6cb1
 ---> 66d86fc07936
Step 10/10 : CMD script/start
 ---> Running in 9181f129cfcc
Removing intermediate container 9181f129cfcc
 ---> 1fa3754ac45a
Successfully built 1fa3754ac45a
Successfully tagged dr_movil_app:latest
Creating dr_movil_db_1 ... done
Creating dr_movil_app_1 ... done
```

This means the project is up and running.

### Stop the project

In order to stop crowdfront as a whole you can run:

```bash
$ docker-compose stop
```

This will stop every container, but if you need to stop one in particular, you can specify it like:

```bash
$ docker-compose stop app
```
or
```bash
$ docker-compose stop db
```
to stop the database

`app` is the service name located on the `docker-compose.yml` file, there you can see the services name and stop each of them if you need to.

### Restoring the database

You probably won't be working with a blank database, so once you are able to run the proyect you can restore the database, to do it, first stop all services:

```
% plis stop
```

Then just lift up the `db` service:

```
% plis start db
```

The next step is to login to the database container:

```
% docker exec -ti crowdfront_db_1 bash
```

This will open up a bash session in to the database container.

Up to this point we just need to download a database dump and copy under `crowdfront/backups/`, this directory is mounted on the container, so you will be able to restore it with:

```
root@a3f695b39869:/# bin/restoredb crowdfront_dev db/backups/<databaseDump>
```

If you want to see how this script works, you can find it under `bin/restoredb`

Once the script finishes its execution you can just exit the session from the container and lift the other services:

```
% plis start
```

### Debugging

We know you love to use `debugger`, and who doesn't, and with Docker is a bit tricky, but don't worry, we have you covered.

Just run this line at the terminal and you can start debugging like a pro:

```
% plis attach web
```

This will display the logs from the rails app, as well as give you access to stop the execution on the debugging point as you would expect.

**Take note that if you kill this process you will kill the web service, and you will probably need to lift it up again.**

### Running specs

No specs yet.

### Checking code for potential issues

TBD
