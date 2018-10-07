FROM python:3.5
MAINTAINER Ravi.Huang <ravi.huang@gmail.com>

COPY entrypoint.sh /

RUN pip install --upgrade pip && \
    pip install flask gunicorn pymysql && \
    chmod +x /entrypoint.sh

ADD . /src
WORKDIR /src
VOLUME /src/db

FROM node:8
RUN npm install towxml

EXPOSE 8000
CMD ["/entrypoint.sh"]


