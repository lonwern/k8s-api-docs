FROM nginx:alpine

LABEL maintainer="lonwern@gmail.com"

COPY ./kubernetes.io /usr/share/nginx/html
