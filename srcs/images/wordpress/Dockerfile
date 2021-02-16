# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kiborroq <kiborroq@kiborroq.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/11 23:29:57 by kiborroq          #+#    #+#              #
#    Updated: 2021/02/16 22:08:16 by kiborroq         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install OS
FROM alpine:3.12

# Install necessary components
RUN apk update
RUN apk add nginx
RUN apk add wget
RUN apk add php7 php7-fpm php7-mbstring php7-json php7-session php7-mysqli
RUN apk add supervisor
RUN wget https://wordpress.org/latest.tar.gz

# Adjust NGINX
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Adjust WORDPRESS
RUN mkdir /www
RUN tar -xf latest.tar.gz -C /www
RUN rm latest.tar.gz
COPY wordpress.conf /www/wordpress/wp-

# Adjut SUPERVISORD
COPY supervisord.conf /etc/supervisord.conf

# Declarate ports
EXPOSE 5050

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]