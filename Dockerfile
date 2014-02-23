FROM cloudfoundry/lucid64
RUN sudo apt-get update
RUN sudo apt-get -y install git-core libmysqlclient-dev libpq-dev libsqlite3-dev
RUN ./common/clone_nise_bosh.sh;cd nise_bosh;./bin/init
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#1.9.3-p484
sudo apt-get -y install ruby


