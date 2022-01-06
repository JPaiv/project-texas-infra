# FROM alpine:latest

# RUN apk update
# RUN apk add py-pip
# RUN apk add --no-cache python3-dev 
# RUN pip install --upgrade pip

# WORKDIR /src/
# COPY . /src/

# RUN pip --no-cache-dir install -r requirements.txt

# EXPOSE 5000

# CMD ["python3", "src/app/app.py"]

FROM python:3-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

EXPOSE 5000

CMD [ "python", "./app.py" ]