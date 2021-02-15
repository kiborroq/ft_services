# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kiborroq <kiborroq@kiborroq.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/11 23:29:57 by kiborroq          #+#    #+#              #
#    Updated: 2021/02/14 22:44:04 by kiborroq         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install OS
FROM alpine:3.12

# Install necessary components
RUN apk update
RUN apk add nginx
RUN apk add wget
RUN apk add php7 php7-fpm php7-mbstring php7-json php7-session php7-mysqli
RUN apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community
RUN apk add supervisor
RUN wget https://wordpress.org/latest.tar.gz

# Adjust NGINX
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Adjust WORDPRESS
RUN mkdir /www
RUN tar -xf latest.tar.gz -C /www
RUN rm latest.tar.gz
COPY wordpress.conf /www/wordpress/wp-config.php

# Adjust TELEGRAF
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# Adjut SUPERVISORD
COPY supervisord.conf /etc/supervisord.conf

# Declarate ports
EXPOSE 5050

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisord.conf"]