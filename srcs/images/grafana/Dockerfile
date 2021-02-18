# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kiborroq <kiborroq@kiborroq.42.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/01 00:34:14 by kiborroq          #+#    #+#              #
#    Updated: 2021/02/18 01:08:33 by kiborroq         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Install OS
FROM alpine:3.12

# Install necessary components
RUN apk update
RUN apk add wget
RUN apk add libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz

# Adjust GRAFANA
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN mv grafana-7.4.0 /usr/share/grafana
RUN rm grafana-7.4.0.linux-amd64.tar.gz
COPY datasource.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY dashboards/*.json /usr/share/grafana/conf/provisioning/dashboards/

# Declarate ports
EXPOSE 3000

ENTRYPOINT ["/usr/share/grafana/bin/grafana-server", "--homepath=/usr/share/grafana"]