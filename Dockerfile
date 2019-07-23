FROM alpine:3.8

RUN apk add --no-cache --update \
  bash \
  gawk \
  sed \
  grep \
  bc \
  coreutils \
  openssh-client \
  curl \
  rsync \
  ncftp \
  git \
  lftp \
  ;

ADD clean-old-backups.sh /clean-old-backups.sh
RUN chmod +x /clean-old-backups.sh

RUN mkdir -p ~/.lftp
RUN echo "set ssl:verify-certificate noset ftp:ssl-allow no" > ~/.lftp/rc