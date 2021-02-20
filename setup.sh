#!/bin/sh

# Delete and then start Minikube
echo "\033[1;32mDelete and then start Minikube\033[0m"
minikube delete
minikube start --driver=virtualbox

# Start Kubernetes dashboard
echo "\033[1;32mStart Kubernetes dashboard\033[0m"
minikube dashboard &

# Adjust MetalLB
echo "\033[1;32mSetup MetalLB\033[0m"
minikube addons enable metallb
kubectl apply -f srcs/yamls/metallb.yaml

# Init Docker in Minikube
echo "\033[1;32mSetup Docker in Minikube\033[0m"
eval $(minikube docker-env)

# Setup an infrastructure of services
echo "\033[1;32mSetup an infrastructure of services\033[0m"

echo "\033[1;32mSetup PHPMYADMIN\033[0m"
docker build -t phpmyadmin-img srcs/images/phpmyadm/
kubectl apply -f               srcs/yamls/phpmyadmin.yaml

echo "\033[1;32mSetup WRODPRESS\033[0m"
docker build -t wordpress-img  srcs/images/wordpress/
kubectl apply -f               srcs/yamls/wordpress.yaml

echo "\033[1;32mSetup MYSQL\033[0m"
docker build -t mysql-img      srcs/images/mysql/
kubectl apply -f               srcs/yamls/mysql.yaml

echo "\033[1;32mSetup NGINX\033[0m"
docker build -t nginx-img      srcs/images/nginx/
kubectl apply -f               srcs/yamls/nginx.yaml

echo "\033[1;32mSetup INFLUXDB\033[0m"
docker build -t influxdb-img   srcs/images/influxdb/
kubectl apply -f               srcs/yamls/influxdb.yaml

echo "\033[1;32mSetup GRAFANA\033[0m"
docker build -t grafana-img    srcs/images/grafana/
kubectl apply -f               srcs/yamls/grafana.yaml

echo "\033[1;32mSetup TELEGRAF\033[0m"
docker build -t telegraf-img   srcs/images/telegraf/
kubectl apply -f               srcs/yamls/telegraf.yaml

echo "\033[1;32mSetup FTPS\033[0m"
docker build -t ftps-img       srcs/images/ftps/
kubectl apply -f               srcs/yamls/ftps.yaml