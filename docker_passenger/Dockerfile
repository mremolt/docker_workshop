FROM dcsfuerth/rvm
MAINTAINER Marc Remolt <marc.remolt@dcs-fuerth.de>

WORKDIR /home/deploy
USER deploy
# WARNING: Without the next line ~ will still bet set to / causing rvm installation to break
ENV HOME /home/deploy

RUN gem install bundler passenger
RUN rvm 2.1.2 do passenger status

ADD config.ru /home/deploy/config.ru

EXPOSE 80

CMD ["rvm", "2.1.2", "do", "passenger", "start", "-e production", "-R config.ru"]
