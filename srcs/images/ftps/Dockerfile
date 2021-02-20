# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kiborroq <kiborroq@kiborroq.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/01 00:34:14 by kiborroq          #+#    #+#              #
#    Updated: 2021/02/20 00:08:24 by kiborroq         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install OS
FROM alpine:3.12

# Install necessary components
RUN apk -U upgrade
RUN apk add openssl
RUN apk add pure-ftpd --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# Adjust SSL
RUN openssl req -x509 -newkey rsa:2048 -nodes -days 365 \
                -subj "/C=RU/ST=Moscow/L=Moscow/O=21school/OU=kiborroq/CN=localhost" \
                -keyout /etc/ssl/private/pure-ftpd.pem \
                -out /etc/ssl/private/pure-ftpd.pem;

# Adjust FTPS
RUN mkdir -p /home/ftpusers/kiborroq
RUN adduser -D -h /home/ftpusers/kiborroq kiborroq
RUN echo "kiborroq:kiborroq" | chpasswd
RUN echo -e "kiborroq\nkiborroq" | pure-pw useradd kiborroq -u kiborroq -d /home/ftpusers/kiborroq

# Declarate ports
EXPOSE 21 21001 21002 21003 21004 21005

ENTRYPOINT ["/usr/sbin/pure-ftpd", "-Y", "2", "-p", "21001:21005", "-P", "192.168.99.103"]