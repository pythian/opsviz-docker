FROM nginx
MAINTAINER devops@pythian.com

EXPOSE 80

COPY ./conf/dashboard.conf /etc/nginx/sites-enabled/dashboard.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /etc/nginx/sites-enabled/default

RUN mkdir -p /var/www/dashboard
WORKDIR /var/www/dashboard
COPY ./index.html /var/www/dashboard/index.html

CMD ["nginx"]
