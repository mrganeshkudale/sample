FROM docker.io/nginx:latest
COPY index.html /usr/share/nginx/html
COPY dev.yml /usr/share/nginx/html
COPY Jenkinsfile /usr/share/nginx/html
