FROM python:3.12.0rc1-bookworm
USER root
COPY . /app
WORKDIR /app
RUN apk add python3 \
        && curl -O https://bootstrap.pypa.io/get-pip.py \
        && python3 get-pip.py
RUN apt-get update
RUN apt-get pip
RUN pip install Flask
RUN curl -sSL https://get.docker.com/ | sh
EXPOSE 5000
CMD ["python3", "bitcoin-app.py"]
