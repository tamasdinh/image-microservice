# handling environmental variables
# source .env
# export POSTGRESS_USERNAME
# export POSTGRESS_USERNAME_64
# export POSTGRESS_PASSWORD
# export POSTGRESS_PASSWORD_64
# export POSTGRESS_DB
# export POSTGRESS_HOST
# export AWS_REGION
# export AWS_PROFILE
# export AWS_BUCKET
# export URL

# build docker images
# docker build -t tamasdinh/udacity-restapi-feed udacity-c3-restapi-feed
# docker build -t tamasdinh/udacity-restapi-user udacity-c3-restapi-user
# docker build -t tamasdinh/udacity-frontend udacity-c3-frontend
# docker build -t tamasdinh/reverseproxy reverseproxy

# push docker images
# docker push tamasdinh/udacity-restapi-feed
# docker push tamasdinh/udacity-restapi-user
# docker push tamasdinh/udacity-frontend
# docker push tamasdinh/reverseproxy

# create Kubernetes control plane on AWS
eksctl create cluster \
--name kubernetes-submit-2 \
--version 1.14 \
--region us-east-1 \
--nodegroup-name submit-workers-2 \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--managed

eksctl utils update-cluster-logging \
--region=us-east-1 \
--cluster=kubernetes-submit \
--enable-types all \
--approve

# adding deployments & services
kubectl apply -f udacity-c3-deployment/k8s/aws-secret.yaml
kubectl apply -f udacity-c3-deployment/k8s/env-secret.yaml
kubectl apply -f udacity-c3-deployment/k8s/env-configmap.yaml
kubectl apply -f udacity-c3-deployment/k8s/backend-feed-service.yaml
kubectl apply -f udacity-c3-deployment/k8s/backend-feed-deployment.yaml
kubectl apply -f udacity-c3-deployment/k8s/backend-user-service.yaml
kubectl apply -f udacity-c3-deployment/k8s/backend-user-deployment.yaml
kubectl apply -f udacity-c3-deployment/k8s/reverseproxy-service.yaml
kubectl apply -f udacity-c3-deployment/k8s/reverseproxy-deployment.yaml
kubectl apply -f udacity-c3-deployment/k8s/frontend-service.yaml
kubectl apply -f udacity-c3-deployment/k8s/frontend-deployment.yaml
