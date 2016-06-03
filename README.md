# Example Docker machine
This tutorial presents a Dockerfile for building an image with PostgreSQL 9.5 on Ubuntu 16.04. It also imports a toy database and shows you how to connect to it.

To install Docker on Ubuntu follow the instructions  [here](https://docs.docker.com/engine/installation/linux/ubuntulinux/).

The first step is creating the docker image. To do that run:

```bash
docker build -t cassio_psql .
```

At the end of the build you should see a message similar to the following:

```
Successfully built 7eb01f9f1d80
```

To execute the created image run:

```bash
docker run -P cassio_psql
```

The flag `-P` publishes all the exposed ports from the container on random ports of the host.

To see on which port of the host the database is bound to:

```bash
docker ps
```

Sample output:
```bash
cassio@darkstar:~/projects/docker$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
c302811eb850        cassio_psql         "/usr/lib/postgresql/"   10 seconds ago      Up 9 seconds        0.0.0.0:32768->5432/tcp   pg-cassio
```

To connect to the toy database run the following. Take notice to use the same port (`-p`) that you see when running the `docker ps` command.

```bash
cassio@darkstar:~/projects/docker$ psql -h localhost -p 32771 mydb mydb
Password for user mydb:
psql (9.5.3)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

mydb=> select * from users;
 id |  name   
----+---------
  1 | cassio1
  2 | cassio2
  3 | cassio3
  4 | cassio4
  5 | cassio5
(5 rows)

mydb=>

```

The password is just `mydb`.

To exit the docker machine just run `ctrl-C` on the terminal.

To start the machine again just issue `docker run -P cassio_psql` again. Be amazed at the speed your database server comes up :-)

Have fun!
