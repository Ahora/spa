FROM nginx:stable

RUN apt-get update && apt-get install -y curl

RUN mkdir -p /app
WORKDIR /app

#COPY dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d
COPY startup.sh /app

CMD ["sh", "startup.sh"]