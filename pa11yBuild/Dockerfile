#ddev-generated
ARG BASE_IMAGE
FROM $BASE_IMAGE

USER root

# Add current ddev user.
ARG username
ARG uid
ARG gid
RUN (groupadd --gid $gid "$username" || groupadd "$username" || true) && (useradd -l -m -s "/bin/bash" --gid "$username" --comment '' --uid $uid "$username" || useradd -l -m -s "/bin/bash" --gid "$username" --comment '' "$username" || useradd -l -m -s "/bin/bash" --gid "$gid" --comment '' "$username" || useradd -l -m -s "/bin/bash" --comment '' $username)

ENTRYPOINT []
USER $username
