FROM centos:latest
RUN yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html
WORKDIR /var/www/html
RUN unzip healet.zip
RUN rm -rf healet.zip &&\ 
    cp -rf healet/* . &&\ 
    rm -rf healet 
EXPOSE 80
cmd ["/usr/sbin/httpd", "-D", "FOREGROUND"]
