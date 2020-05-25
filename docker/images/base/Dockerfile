FROM alpine

LABEL maintainer="mars16 <mars16@gmail.com>"
LABEL description="Base image"

ARG ROOT_PASSWORD

RUN apk add --no-cache shadow
# Change default root password
RUN echo -e "$ROOT_PASSWORD\n$ROOT_PASSWORD" | passwd root
