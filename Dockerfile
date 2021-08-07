FROM ruby:2.5
WORKDIR /usr/src/app
COPY bin/printable-ascii ./
ENTRYPOINT ["./printable-ascii"]
