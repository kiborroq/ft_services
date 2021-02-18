# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kiborroq <kiborroq@kiborroq.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/03 12:26:55 by kiborroq          #+#    #+#              #
#    Updated: 2021/02/18 00:27:48 by kiborroq         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install OS
FROM alpine:3.12

# Install necessary components
RUN apk -U upgrade
RUN apk add openssh
RUN apk add openssl
RUN apk add nginx
RUN apk add supervisor

# Adjust SSH
RUN adduser -D kiborroq
RUN echo "kiborroq:kiborroq" | chpasswd
RUN ssh-keygen -A

# Adjust SSL
RUN openssl req -x509 -newkey rsa:2048 -nodes -days 365 \
                -subj "/C=RU/ST=Moscow/L=Moscow/O=21school/OU=kiborroq/CN=localhost" \
                -keyout /etc/ssl/private/host.key \
                -out /etc/ssl/certs/host.crt;

# Adjust NGINX
RUN mkdir /run/nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Adjust site
RUN mkdir /www
COPY index.html /www/index.html

# Adjut SUPERVISORD
COPY supervisord.conf /etc/supervisord.conf

# Declarate ports
EXPOSE 80 443 22

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]