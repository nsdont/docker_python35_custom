FROM daocloud.io/library/python:3.5

ADD pip.conf /root/.pip/pip.conf
ADD requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt
RUN pip install -i http://pypi.oneapm.com/simple --trusted-host pypi.oneapm.com --upgrade blueware

RUN adduser --disabled-password --gecos '' abstack
