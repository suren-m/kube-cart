FROM python:3.11.2-slim-bullseye
LABEL org.opencontainers.image.source https://github.com/suren-m/kube-cart

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "app.py"]
