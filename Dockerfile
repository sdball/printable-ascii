FROM ruby:3.0-alpine
WORKDIR /usr/src/app
COPY bin/printable-ascii ./
ENTRYPOINT ["./printable-ascii"]
