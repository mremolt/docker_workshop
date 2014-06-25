#! /bin/bash -l

RAILS_ENV=production bin/rake db:create db:migrate
rvm 2.1.2 do passenger start -e production
