#ddev-generated
ARG BASE_IMAGE
FROM $BASE_IMAGE

# delete the default 'node' user with uid 1000 and add current ddev user
ARG username
ARG uid
ARG gid

RUN apk add --no-cache git && \
    cd /app && \
    npm install --save-dev macieklewkowicz/pa11y-reporter-junit#pull/2/head && \
    npm install --save-dev pa11y-ci