FROM cloudfoundry/lucid64
RUN apt-get update
RUN apt-get -y install git-core libmysqlclient-dev libpq-dev libsqlite3-dev
ADD ./common /common
ADD ./local /local
RUN "/local/clone_nise_bosh.sh"
RUN "/local/install_rbenv.sh"
RUN "gem install bundler cf --no-rdoc --no-ri"
RUN "gem install rake -v 0.9.2.2 "
RUN "/local/clone_cf_release.sh"
RUN "NISE_BOSH_REV=$NISE_BOSH_REV ./local/launch_nise_bosh.sh"
RUN "/local/postinstall.sh"