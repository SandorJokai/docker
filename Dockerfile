FROM httpd:2.4

MAINTAINER Sandor Jokai <shanxman1986@gmail.com> 

RUN yum -y install httpd

EXPOSE 80

CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
