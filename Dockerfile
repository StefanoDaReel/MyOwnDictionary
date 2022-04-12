FROM python:3

WORKDIR /code
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . .

RUN chmod +x ./wait-for-it.sh

ENV DJANGO_SETTINGS_MODULE=modi.docker.settings
RUN celery upgrade settings modi/docker/settings.py --django