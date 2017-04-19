#!/bin/sh -e

port=$1

echo 'events {
  worker_connections 1024;
}

http {

  upstream web {
    ip_hash;
    server photoweb:'$port';
  }

  # portal
  server {
    location / {
      proxy_pass http://web/;
    }
    listen '$port';
    server_name localhost;
  } 

}' > nginx.conf
