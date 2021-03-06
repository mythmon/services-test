#!/bin/bash -xe

## these will be added by Vagrant and the nightly refresh job
# sudo apt-get -y install mercurial
hg clone http://hg.mozilla.org/mozilla-central
# cd mozilla-central/testing/tps

# tweak these:
#sed -i "s/mozprofile ==[^']*/mozprofile == 0.27/" setup.py
#sed -i "s/mozversion ==[^']*/mozversion == 1.4/" setup.py

cd $PWD/mozilla-central/testing/tps
./create_venv.py --username="tpstps@restmail.net" --password="TESTINGtesting" $HOME/tps-env
. $HOME/tps-env/bin/activate
Xvfb :20 >& /tmp/xerrors &
export DISPLAY=:20
runtps --binary=/usr/bin/firefox
pkill -f :20
