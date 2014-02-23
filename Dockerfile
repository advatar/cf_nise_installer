FROM cloudfoundry/lucid64
RUN apt-get update
RUN apt-get -y install git-core libmysqlclient-dev libpq-dev libsqlite3-dev
RUN common/clone_nise_bosh.sh;cd nise_bosh;./bin/init
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#1.9.3-p484
RUN apt-get -y install ruby
RUN gem install bundler cf --no-rdoc --no-ri
RUN gem install rake -v 0.9.2.2 
RUN local/clone_cf_release.sh
RUN NISE_BOSH_REV=$NISE_BOSH_REV ./local/launch_nise_bosh.sh
RUN local/postinstall.sh