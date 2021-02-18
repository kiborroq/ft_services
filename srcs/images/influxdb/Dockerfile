# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kiborroq <kiborroq@kiborroq.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/01 00:34:14 by kiborroq          #+#    #+#              #
#    Updated: 2021/02/18 00:27:12 by kiborroq         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install OS
FROM alpine:3.12

# Install necessary components
RUN apk -U upgrade
RUN apk add influxdb

# Declarate ports
EXPOSE 8086

ENTRYPOINT ["/usr/sbin/influxd", "-config", "etc/influxdb.conf"]