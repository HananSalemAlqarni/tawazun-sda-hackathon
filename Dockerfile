FROM node:latest

LABEL author="Hanan alqarni"

EXPOSE 3000
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
USER ubuntu
WORKDIR /home/ubuntu


COPY . /home/ubuntu
RUN npm install

VOLUME [ "/var/www" ]

CMD [ "npm","start" ]