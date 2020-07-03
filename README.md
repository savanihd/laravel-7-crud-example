

# Laravel CRUD K8S

## Build base 

```bash
docker build -f ./base-image/Dockerfile -t parsaeian/php-base . 
```

## Build app image

```bash
docker build -t parsaeian/laravel-crud .
```

## Run the following commands for deploying your to Kubernetes:

```bash
kubectl create namespace prd

kubectl -f k8s/configmaps.yaml

kubectl -f k8s/deployment.yaml

kubectl expose deployment laravel-crud --port=8000 --target-port=80 --type=NodePort -n prd

# TODO: deploy database
```

## Chech service

```
kubectl get svc laravel-crud -n prd
```

## Configure HAProxy
Change this [haproxy.cfg](haproxy.cfg) with your workers ip and ports
