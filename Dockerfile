FROM ubuntu:bionic

LABEL maintainer="danstan.otieno@gmailc.om"

RUN apt-get update

RUN apt-get install gnupg wget cron -y

RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list

RUN apt-get update

RUN apt-get install -y mongodb-org-shell mongodb-org-tools -y

RUN echo "mongodb-org-shell hold" | dpkg --set-selections && \
    echo "mongodb-org-tools hold" | dpkg --set-selections

RUN mkdir /backup

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]