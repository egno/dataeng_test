# Pull the base image
FROM python:3.7

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install python3-dev default-libmysqlclient-dev  -y

RUN mkdir /code
WORKDIR /code

RUN pip install pip -U
ADD requirements.txt .

RUN pip install -r requirements.txt
ADD . .


