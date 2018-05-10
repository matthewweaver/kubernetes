# RUN AS ROOT
minikube start # minikube only
eval $(minikube docker-env)

# Build docker image of SpringBootApplication using maven docker plugin
mvn compile -e
mvn package
mvn dockerfile:build

# Use service yaml to create kubernetes service on cluster
kubectl create -f hellojavakubernetes-service.yaml

# Use deployment yaml to create kubernetes service on cluster
kubectl create -f hellojavakubernetes-deployment.yaml

# Show endpoint to send requests to
# kubectl describe service hellojavakubernetes # kubernetes only
minikube service hellojavakubernetes --url # minikube only
