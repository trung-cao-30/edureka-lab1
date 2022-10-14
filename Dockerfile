FROM  devopsedu/webapp

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

COPY website/ /var/www/html/

EXPOSE 80

CMD [ "apachectl", "-D", "FOREGROUND" ]