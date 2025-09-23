#ddev-generated
ARG BASE_IMAGE
FROM $BASE_IMAGE



# FROM dcycle/pa11y:2
# @note GIT only needed because of the fork.
# https://github.com/macieklewkowicz/pa11y-reporter-junit


# delete the default 'node' user with uid 1000 and add current ddev user
ARG username
ARG uid
ARG gid

# https://github.com/macieklewkowicz/pa11y-reporter-junit
RUN apk add --no-cache git && \
    cd /app && \
    npm install --save-dev macieklewkowicz/pa11y-reporter-junit#pull/2/head && \
    npm install --save-dev pa11y-ci