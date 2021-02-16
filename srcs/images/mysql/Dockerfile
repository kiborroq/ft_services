# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kiborroq <kiborroq@kiborroq.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/01 00:34:14 by kiborroq          #+#    #+#              #
#    Updated: 2021/02/16 00:40:24 by kiborroq         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install OS
FROM alpine:3.12

# Install necessary components
RUN apk update
RUN apk add mysql mysql-client

# Adjust MYSQL
RUN mkdir -p /var/lib/mysql /run/mysqld/
COPY wordpress.sql /wordpress.sql
COPY mysql.conf /etc/my.cnf

# Copy necessary scripts to container root
COPY run_container.sh /run_container.sh
RUN chmod +x run_container.sh

# Declarate ports
EXPOSE 3306

ENTRYPOINT ["./run_container.sh"]