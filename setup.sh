#!/bin/sh

# Delete and then start Minikube
echo "Delete and then start Minikube"
minikube delete
minikube start --driver=virtualbox

# Start Kubernetes dashboard
echo "Start Kubernetes dashboard"
minikube dashboard &

# Adjust MetalLB
echo "Adjust MetalLB"
minikube addons enable metallb
kubectl apply -f srcs/yamls/metallb.yaml

# Init Docker in Minikube
echo "Init Docker in Minikube"
eval $(minikube docker-env)

# Setup an infrastructure of services
echo "Setup an infrastructure of services"

echo "Setup NGINX"
docker build -t nginx-img      srcs/images/nginx/
kubectl apply -f               srcs/yamls/nginx.yaml

echo "Setup PHPMYADMIN"
docker build -t phpmyadmin-img srcs/images/phpmyadm/
kubectl apply -f               srcs/yamls/phpmyadmin.yaml

echo "Setup WRODPRESS"
docker build -t wordpress-img  srcs/images/wordpress/
kubectl apply -f               srcs/yamls/wordpress.yaml

echo "Setup MYSQL"
docker build -t mysql-img      srcs/images/mysql/
kubectl apply -f               srcs/yamls/mysql.yaml

echo "Setup INFLUXDB"
docker build -t influxdb-img   srcs/images/influxdb/
kubectl apply -f               srcs/yamls/influxdb.yaml

echo "Setup GRAFANA"
docker build -t grafana-img    srcs/images/grafana/
kubectl apply -f               srcs/yamls/grafana.yaml

echo "Setup TELEGRAF"
docker build -t telegraf-img   srcs/images/telegraf/
kubectl apply -f               srcs/yamls/telegraf.yaml

echo "Setup FTPS"
docker build -t ftps-img       srcs/images/ftps/
kubectl apply -f               srcs/yamls/ftps.yaml