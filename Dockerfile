FROM nginx:stable-alpine3.17-slim
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "bitcoin-app.py" ]
