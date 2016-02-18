#/bin/sh

apt-get update
apt-get install -y build-essential g++ flex bison gperf ruby perl libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev libpng-dev libjpeg-dev python libx11-dev libxext-dev wget
rm -rf /var/lib/apt/lists/*
cd /tmp;
export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
wget http://7xocud.dl1.z0.glb.clouddn.com/$PHANTOM_JS.tar.bz2
tar xvjf $PHANTOM_JS.tar.bz2
mv $PHANTOM_JS /usr/local/share
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
