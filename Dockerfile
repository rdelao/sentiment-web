FROM ubuntu:latest
MAINTAINER Big Don
RUN DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing && apt-get install -y build-essential git python python-dev python-setuptools nginx supervisor bcrypt libssl-dev libffi-dev libpq-dev vim rsyslog wget libevent-dev python-all-dev
RUN easy_install pip
RUN pip install flask
RUN easy_install greenlet
RUN easy_install gevent 
COPY . /app
WORKDIR /app
ADD ./config.py  /app
ENTRYPOINT ["nohup"]
CMD ["python", "run.py"]