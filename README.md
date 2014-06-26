# Docker workshop

## General info

All docker images are pushed as user dcsfurth (https://hub.docker.com/u/dcsfuerth/) 
and are ready for download.


## TOC

### Introduction

Others are better at slides than I am:
http://de.slideshare.net/dotCloud/docker-intro-november

Task: Follow http://www.docker.com/tryit/

Now let's start the provided VMWare image.


### Running Docker containers interactively

https://docs.docker.com/reference/commandline/cli/

Hint: docker run -i -t
Hint: Use a login shell!


### Commtting container changes

http://docs.docker.com/userguide/dockerimages/#creating-our-own-images

Task: Build an image from the interactive session of the previouts chapter.


### Dockerfile basics

https://docs.docker.com/reference/builder/


### Linking containers

https://docs.docker.com/userguide/dockerlinks/


### Tutorial

### Create an updated Ubuntu image that has vim and git installed.

Task: Based from a clean ubuntu image, write a Dockerfile that updates all
packages and then installs vim and git.

Test the image by running it interactively.

Hint: Try to find Linux command params that suppress normal output, it will
make your build experience much nicer.


### Create the rvm image

Task: Install rvm into a base Ubuntu image, but as an unprivileged user account *deploy*.
Then install current ruby and run *ruby --version* as Docker CMD.

Hint (dependencies, no need to find them out yourself):

    apt-get -qq -y install bash curl patch bzip2 ca-certificates gawk vim \
        g++ gcc make libc6-dev patch openssl ca-certificates libreadline6 \
        libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev \
        libsqlite3-dev sqlite3 autoconf libmysqlclient-dev mysql-client \
        libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

Hint: Bug in Docker! Even if you set WORKDIR, $HOME and ~ stay at /, braking
rvm installation. Solution: Set $HOME via ENV Dockerfile command.

Spoilers: docker_rvm


### Create the passenger image

Task: Based upon docker_rvm, install passenger, add a simple config.ru and run
it as CMD. Expose the passenger port and test.

Hint: Use ADD to get the config.ru into the container.

Spoilers: docker_passenger


### Pull and run a mysql server image

Task: Install orchardup/mysql and run it.
Test it by connecting to the dockerized mysql server .

Have a look at the docs at https://registry.hub.docker.com/u/orchardup/mysql/
for sensible settings.

Hint:
    docker run -d --name railsapp_mysql -e MYSQL_USER=railsapp -e MYSQL_PASSWORD=erghrjhhbrRTHY12 -e MYSQL_ROOT_PASSWORD=xehVg1IpVhEmlwRMG -e MYSQL_DATABASE=railsapp_production orchardup/mysql

Hint: The above command does not allow external access!


### Create the railsapp image

Task: Create a rails app with a simple scaffold and deploy it to a docker
container (based on docker_passenger).
Link it to to the mysql container from the previous task.

Bonus: Export the Rails log directory as a volume to allow easy access.

Hint: You can reuse ENV variables from the mysql container (and the Dockerfile) inside the Rails
app (database.yml, secret tokens).

Spoilers: docker_rails


### Push the created images (or at least one) to the docker hub.

Task: Create an account at https://registry.hub.docker.com/, then follow the
guide to upload one of the images created by you.

Hint: The first images are smaller, so faster upload ;-)



## Install Docker under OSX/Windows

boot2docker: http://docs.docker.com/installation/mac

Warning: Every tutorial about public ports in containers is written from
a Linux perspective, meaning the docker daemon is on the same machine.

With boot2docker the docker daemon runs inside a VirtualBox, so when the docs
say localhost, translate to "IP of the VM".

Via

    boot2docker ip

you can find it out.


### Testing the installation

Task: Copy one of the Dockerfiles created by you from the Ubuntu VM to your main
machine. Build it and then run the image.


### Fetch your created and pushed image(s) to the boot2docker installation and run it.

Now you are on your own ...




