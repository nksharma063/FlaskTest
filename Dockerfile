FROM python:3.12-slim-buster

WORKDIR /usr/src/app

RUN pip install --upgrades pip
COPY .requirements.txt /usr/src/app/.requirements.txt
RUN pip install -r requirements.txt

COPY . /usr/src/app

FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d
