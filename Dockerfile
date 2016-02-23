FROM daocloud.io/library/python:3.5

ADD pip.conf /root/.pip/pip.conf
ADD requirements.txt /tmp/requirements.txt

RUN echo 'deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib' > /etc/apt/sources.list && echo \
    'deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib' >> /etc/apt/sources.list && echo \
    'deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib' >> /etc/apt/sources.list && echo \
    'deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib' >> /etc/apt/sources.list
RUN apt-get update; \
    apt-get install -y build-essential g++ flex bison gperf ruby perl libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev libpng-dev libjpeg-dev libx11-dev libxext-dev wget ;\
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp ;\
    export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64" ;\
    wget http://7xocud.dl1.z0.glb.clouddn.com/$PHANTOM_JS.tar.bz2 ;\ 
    tar xvjf $PHANTOM_JS.tar.bz2 ;\ 
    mv $PHANTOM_JS /usr/local/share ;\ 
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

RUN wget http://7xocud.dl1.z0.glb.clouddn.com/chromedriver_linux64.zip -P /tmp; \
    unzip /tmp/chromedriver_linux64.zip /usr/local/share/chromedriver ;\
    chmod +x /usr/local/share/chromedriver; \
    ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver; \
    ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
    

RUN pip install -r /tmp/requirements.txt
RUN pip install -i http://pypi.oneapm.com/simple --trusted-host pypi.oneapm.com --upgrade blueware

RUN adduser --disabled-password --gecos '' abstack
