Lighttpd & php7
==============
Lighttpd server on Ubuntu linux.

## Build using:
`docker build -t lighttpd-php7 .`

`docker run --name lighttpd -d -p 80:80 -v <project-directory>:/var/www/html lighttpd-php7`

## Run using:
`docker run --name lighttpd -d -p 80:80 -v <project-directory>:/var/www drova/lighttpd-php7`

## Environment Variables:
 - PHP_CONTAINER_HOST - This is an optional variable. It takes the name of the host and inserts it up the `host` in FastCGI Server conf file `"host" => "INSERTED_IP_VALUE",`. (since 1.4.46, DNS name is resolved to first IP at lighttpd startup)

## Docker Compose:
Add the following lines in an `docker-compose.yml` file:

lighttpd:
    container_name: lighttpd
    image: drova/lighttpd-php7
    ports:
      - "80:80"
    volumes:
      - ./www:/var/www/html
      - ./lighttpd/log:/var/log/lighttpd
      - ./php/php.ini:/etc/php/7.2/fpm/php.ini
      - ./lighttpd/lighttpd.conf:/etc/lighttpd/lighttpd.conf
