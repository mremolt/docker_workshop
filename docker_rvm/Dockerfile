FROM ubuntu:14.04
MAINTAINER Marc Remolt <marc.remolt@dcs-fuerth.de>

RUN apt-get -qq update
RUN apt-get -qq -y upgrade
RUN apt-get -qq -y install bash curl patch bzip2 ca-certificates gawk vim \
	g++ gcc make libc6-dev patch openssl ca-certificates libreadline6 \
        libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev \
        libsqlite3-dev sqlite3 autoconf libmysqlclient-dev mysql-client \
        libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev 


RUN useradd -m -s /bin/bash -d /home/deploy deploy
WORKDIR /home/deploy
USER deploy
# WARNING: Without the next line ~ will still bet set to / causing rvm installation to break
ENV HOME /home/deploy

RUN curl -sSL https://get.rvm.io | bash -s stable 

RUN ["bash", "-lc", "rvm install 2.1.2"]
RUN ["bash", "-lc", "rvm use 2.1.2 --default"]

ENV PATH /home/deploy/.rvm/gems/ruby-2.1.2/bin:/home/deploy/.rvm/gems/ruby-2.1.2@global/bin:/home/deploy/.rvm/rubies/ruby-2.1.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/deploy/.rvm/bin

RUN gem install bundler
RUN ruby --version
