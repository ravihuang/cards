FROM python:3.5.6-alpine
MAINTAINER Ravi.Huang <ravi.huang@gmail.com>

ADD . /src
WORKDIR /src
RUN pip install --upgrade pip \
    && pip install flask gunicorn pymysql

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME /src/db

EXPOSE 8000
CMD ["/entrypoint.sh"]


