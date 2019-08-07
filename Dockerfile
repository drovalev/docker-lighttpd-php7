FROM ubuntu

MAINTAINER  Roman Drovalev

RUN  apt-get update && apt-get upgrade -y && \
echo 5 | apt-get install -y tzdata && \
apt-get install php-fpm php-mbstring php-xml php-mysql apt-transport-https lighttpd -y && \
apt-get autoremove && apt-get clean && \
lighttpd-enable-mod fastcgi && lighttpd-enable-mod fastcgi-php && \
mkdir -p /run/php /var/run/lighttpd && touch /run/php/php7.2-fpm.sock && \
sed -i 's/.*;cgi.fix_pathinfo=1.*/cgi.fix_pathinfo=1/' /etc/php/7.2/fpm/php.ini && \
ln -s /var/run/php/php7.2-fpm.sock /var/run/lighttpd/php.socket-0
RUN chown -R www-data:www-data /var/log/lighttpd

EXPOSE 80
VOLUME /var/www/html
CMD php-fpm7.2 -D && /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf && bash
