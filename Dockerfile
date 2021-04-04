FROM  httpd
ADD   index2.html /usr/local/apache2/htdocs
CMD ["httpd-foreground"] 

