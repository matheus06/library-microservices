# Kubernets

## Instal Helm

## Enable Docker Desktop Kubernetes

## Deploy Ingress 

* https://kubernetes.github.io/ingress-nginx/deploy

```
helm upgrade --install ingress-nginx ingress-nginx  --repo https://kubernetes.github.io/ingress-nginx   --namespace ingress-nginx --create-namespace
```

## Deploy Dashboard

* https://github.com/kubernetes/dashboard

Create Users
```
kubectl apply -f dashboard-adminuser.yaml
```

Deploy dashboar
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
```

Run
```
kubectl proxy
```

Get Token
```
kubectl -n kubernetes-dashboard create token admin-user
```

Access

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.


## Buid UI

Add var with registry name!!!!!

docker build -t library-ui .
docker tag library-ui matheus06/library-ui:0.1.0
docker push matheus06/library-ui:0.1.0

## Build APIS

docker build -t library-books .
docker tag library-books matheus06/library-books:0.1.0
docker push matheus06/library-books:0.1.0

docker build -t library-shop .
docker tag library-shop matheus06/library-shop:0.1.0
docker push matheus06/library-shop:0.1.0

## Dapr

Install Dapr on k8s:
```
dapr init -k
```

Dapr Dashboard:
```
dapr dashboard -k
```

## Set context

```
kubectl config set-context --current --namespace=library
```

## RabbitMq

```
helm repo add my-repo https://charts.bitnami.com/bitnami
helm install rabbitmq my-repo/rabbitmq
```

## Deploy App

```
helm upgrade --install library-app . --namespace=library  --debug --dry-run
```