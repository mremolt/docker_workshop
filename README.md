# Docker workshop

## General info

All docker images are pushed as user dcsfurth (https://hub.docker.com/u/dcsfuerth/) 
and are ready for download.


## TOC

### Introduction

Others are better at slides than I am:
http://de.slideshare.net/dotCloud/docker-intro-november

http://www.docker.com/tryit/

Now let's start the provided VMWare image.


### Running Docker containers interactively

https://docs.docker.com/reference/commandline/cli/


### Commtting container changes

http://docs.docker.com/userguide/dockerimages/#creating-our-own-images


### Dockerfile basics

https://docs.docker.com/reference/builder/


### Tutorial

### Create an updated Ubuntu image that has gcc and git installed.


### Create the rvm image

Task: Install rvm into a base Ubuntu image, but as an unprivileged user account *deploy*.
Then install current ruby and run *ruby --version* as Docker CMD.

Hint (dependencies):
apt-get -qq -y install bash curl patch bzip2 ca-certificates gawk vim \
        g++ gcc make libc6-dev patch openssl ca-certificates libreadline6 \
        libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev \
        libsqlite3-dev sqlite3 autoconf libmysqlclient-dev mysql-client \
        libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

Spoilers: docker_rvm


### Create the passenger image

Task: Based upon docker_rvm, install passenger, add a simple config.ru and run
it as CMD. Expose the passenger port and test.

Spoilers: docker_passenger


### Pull and run the mysql image

Task: Install orchardup/mysql and run it.
Test it by connecting to the dockerized mysql server .

Hint:
docker run -d --name railsapp_mysql -e MYSQL_USER=railsapp -e MYSQL_PASSWORD=erghrjhhbrRTHY12 -e MYSQL_ROOT_PASSWORD=xehVg1IpVhEmlwRMG -e MYSQL_DATABASE=railsapp_production orchardup/mysql
Hint: The above command does not allow external access!


### Create the railsapp image

Task: Create a rails app with a simple scaffold and deplot it to a docker image
(based on docker_passenger).
Connect to the mysql container from the previous task.

Spoilers: docker_rails


## Install Docker under OSX/Windows

boot2docker: http://docs.docker.com/installation/mac

Warning: Every tutorial about public ports in containers is written from
a Linux perspective, meaning the docker daemon is on the same machine.

With boot2docker the docker daemon runs inside a VirtualBox, so when the docs
say localhost, translate to "IP of the VM".

Via

    boot2docker ip

you can find it out.








