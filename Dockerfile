FROM rickshawhobo/simple-php

RUN apt-get update && \
    apt-get install -y gnupg && \
    curl -sL https://deb.nodesource.com/setup_12.x -o /nodesource_setup.sh && \
    chmod a+x /nodesource_setup.sh && \
    /nodesource_setup.sh && \
    apt-get install -y nodejs && \
    apt-get install -y libxml2-dev && \
    docker-php-ext-install soap && \
    apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install && \
    rm google-chrome-stable_current_amd64.deb

RUN apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

ADD ./docker/php/limits.ini $PHP_INI_DIR/conf.d/


WORKDIR /code

