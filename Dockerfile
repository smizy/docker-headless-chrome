FROM node:8.4-slim

RUN set -x \
    ## - chrome dependencies
    && apt-get update \
    && apt-get install -yq \
        libasound2 \
        libatk1.0-0 \
        libcups2 \
        libgconf-2-4 \
        libgtk-3-0 \
        libnss3 \
        libx11-xcb1 \ 
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxi6 \
        libxrandr2 \
        libxss1 \
        libxtst6 \

    ## - noto font cjk
    && apt-get install \
        unzip \
    && mkdir -p \
        /root/.fonts \
        /root/.config/fontconfig \
        /tmp/noto \
    && curl -sSL -o /tmp/noto/noto_sans.zip https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip \
    && cd /tmp/noto \
    && unzip -o noto_sans.zip \
    && mv *.otf /root/.fonts/ \
    && cd / \
    && rm -rf /tmp/noto \
    && fc-cache -fv \
    && fc-match \

    ## - puppeteer
    && yarn add \
        async-await-parallel \
        commander \
        puppeteer \
    && ln -s /node_modules/puppeteer/.local-chromium/linux-*/chrome-linux/chrome /usr/local/bin/chrome \
    
    ## cleanup
    && apt-get purge -y --auto-remove \
        unzip 

COPY fonts.conf /root/.config/fontconfig

ENV CHROME_PATH /usr/local/bin/chrome