FROM python:3.12.0rc1-bookworm
USER root
COPY . /app
WORKDIR /app
RUN apt-get update
RUN pip install python3
RUN curl -sSL https://get.docker.com/ | sh
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python3", "bitcoin-app.py"]
