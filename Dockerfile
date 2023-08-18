FROM python:3.12.0rc1-bookworm
USER root
COPY . /app
WORKDIR /app
RUN apt-get update
RUN apt-get pip
RUN pip install python
RUN pip install Flask
RUN curl -sSL https://get.docker.com/ | sh
EXPOSE 5000
CMD ["python3", "bitcoin-app.py"]
