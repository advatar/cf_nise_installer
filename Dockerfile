FROM cloudfoundry/lucid64
RUN apt-get update
RUN apt-get -y install apt-utils git-core libmysqlclient-dev libpq-dev libsqlite3-dev
ADD ./common /common
ADD ./local /local
RUN "/local/clone_nise_bosh.sh"
RUN "/local/install_rbenv.sh"
RUN "/local/clone_cf_release.sh"
RUN "/local/launch_nise_bosh.sh"
RUN "/local/postinstall.sh"