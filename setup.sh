#!/bin/sh

# Delete and then start Minikube
echo "Delete and then start Minikube"
minikube delete
minikube start --driver=virtualbox --memory='3000'

# Adjust MetalLB
echo "Adjust MetalLB"
minikube addons enable metallb
kubectl apply -f srcs/yamls/metallb.yaml

# Init Docker in Minikube
echo "Init Docker in Minikube"
eval $(minikube docker-env)

# Build all images
echo "Build all images"
docker build -t nginx-image      srcs/images/nginx/
docker build -t phpmyadmin-image srcs/images/phpmyadm/
docker build -t wordpress-image  srcs/images/wordpress/
docker build -t mysql-image      srcs/images/mysql/
docker build -t influxdb-image   srcs/images/influxdb/
docker build -t grafana-image    srcs/images/grafana/

# Setup an infrastructure of services
echo "Setup an infrastructure of services"
kubectl apply -f srcs/yamls/envmap.yaml
kubectl apply -f srcs/yamls/nginx.yaml
kubectl apply -f srcs/yamls/phpmyadmin.yaml
kubectl apply -f srcs/yamls/wordpress.yaml
kubectl apply -f srcs/yamls/mysql.yaml
kubectl apply -f srcs/yamls/influxdb.yaml
kubectl apply -f srcs/yamls/grafana.yaml

# Start Kubernetes dashboard
echo "Start Kubernetes dashboard"
minikube dashboard & sleep 1