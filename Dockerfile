FROM docker.io/nginx:latest
COPY index.html /usr/share/nginx/html
COPY development.yml /usr/share/nginx/html/dev.yml
COPY Jenkinsfile /usr/share/nginx/html
