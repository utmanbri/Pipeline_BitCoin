FROM python:3.12.0rc1-bookworm
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python3", "bitcoin-app.py"]
