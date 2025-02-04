# syntax=docker/dockerfile:experimental
FROM ubuntu:20.04
RUN useradd -ms /bin/bash builder \
  && apt-get -qq update && apt-get -qq install sudo \
  && /bin/bash -c 'echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/99_sudo_include_file'
USER builder
WORKDIR /openwrt
CMD ["/bin/bash"]
RUN --mount=type=bind,source=.,target=/mnt cd /mnt && ./initenv.sh
