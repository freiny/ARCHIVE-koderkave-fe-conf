FROM alpine:3.4

RUN apk add --update nginx && rm -rf /var/cache/apk/*
RUN rm -v /etc/nginx/nginx.conf
ADD dev.conf /etc/nginx/nginx.conf
RUN openssl genrsa -out /etc/ssl/private/example.com.key 2048
RUN openssl req -new -key /etc/ssl/private/example.com.key -out /etc/ssl/private/example.com.csr

EXPOSE 3000
CMD ["nginx"]
