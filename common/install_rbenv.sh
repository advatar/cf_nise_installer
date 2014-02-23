#!/bin/bash -ex

# Install rbenv and Ruby

if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
    echo 'eval "$(rbenv init -)"' >> ~/.profile
fi
. ~/.profile
if ! (rbenv versions | grep -q 1.9.3-p484); then
    rbenv install 1.9.3-p484
fi
rbenv local 1.9.3-p484
