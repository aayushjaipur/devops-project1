FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip -y
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip
RUN unzip healet.zip
RUN rm -rf healet.zip &&\ 
    cp -rf healet/* . &&\ 
    rm -rf healet 
EXPOSE 80
cmd ["/usr/sbin/httpd", "-D", "FOREGROUND"]
