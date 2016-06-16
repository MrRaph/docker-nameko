FROM mrraph/docker-python

ONBUILD COPY my_runonce/ /etc/my_runonce
ONBUILD COPY my_runalways/ /etc/my_runalways

ONBUILD COPY requirements.txt /tmp/requirements.txt


RUN apk --update add python py-pip openssl ca-certificates py-openssl wget
ONBUILD RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev python-dev py-pip build-base \
  && pip install --upgrade pip \
  && pip install nameko \
  && pip install -r /tmp/requirements.txt \
  && apk del build-dependencies
