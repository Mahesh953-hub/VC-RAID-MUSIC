FROM python:3.9

RUN apt update && apt upgrade -y
RUN apt install python3-pip -y
RUN apt install ffmpeg -y
RUN apt-get -y install \
    curl \
    default-jdk \
    git \
    libcurl4-openssl-dev \
    libpq-dev \
    libmcrypt-dev \
    libpq5 \
    npm \
    node \
    zlib1g-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev

    
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN npm i -g npm

RUN mkdir /app/
COPY . /app
WORKDIR /app

RUN pip3 install --upgrade pip
RUN pip3 install -U -r requirements.txt

CMD python3 main.py
