FROM dcsfuerth/passenger

MAINTAINER Marc Remolt <marc.remolt@dcs-fuerth.de>

USER root

ADD . /home/deploy/src
ADD run.sh /home/deploy/run.sh
RUN chown -R deploy:deploy /home/deploy/src

USER deploy
WORKDIR /home/deploy/src
ENV HOME /home/deploy/src
ENV SECRET_KEY_BASE 37cdb5c96fb5b744b1db1d7f4016e6ef80c96545be2c7ab8f17ab31d72435d1647fb8f5c92dab57786170a09937b27dbf0dd1769c45d278b48cfd45000f3ef6d 

RUN bundle install --quiet
RUN bin/rake assets:precompile

EXPOSE 3000
ENTRYPOINT ["./run.sh"]
