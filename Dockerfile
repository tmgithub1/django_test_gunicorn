FROM ubuntu:18.04

EXPOSE 8000

ENV PYTHONIOENCODING=utf-8

ENV PYTHONUNBUFFERED=1

RUN apt-get update

RUN apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y python3.6 python3.6-dev python3-pip
	
RUN ln -sfn /usr/bin/python3.6 /usr/bin/python3 && ln -sfn /usr/bin/python3 /usr/bin/python && ln -sfn /usr/bin/pip3 /usr/bin/pip

RUN apt-get install -y gunicorn

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app app

#ENV PYTHONPATH "${PYTONPATH}:/app"

RUN adduser user
USER user