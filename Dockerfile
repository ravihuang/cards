FROM python:3.5
MAINTAINER Ravi.Huang <ravi.huang@gmail.com>

RUN pip install --upgrade pip \
    && pip install flask gunicorn pymysql

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ADD . /src
WORKDIR /src
VOLUME /src/db

EXPOSE 8000
CMD ["/entrypoint.sh"]


