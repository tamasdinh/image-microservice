# Image sharing Microservice

## Table of Contents

* [Project Goals](#Project-goals)
* [Getting Started](#Getting-started)
* [Built with](#Built-with)
* [Authors](#Authors)

## Project goals

The goal of the project was to build simple image sharing app that runs on Kubernetes in a microservices deployment.

The key views / functionalities are:
* ```Signup and Login```
  - the user can sign up with an email address and a password
  - user can log in, in which case he/she can upload pictures with a caption
* ```Home```
  - when visiting the home page, the feed of previously uploaded images is displayed
  - if the user was previously logged in, the app retains the log in from the same device
* ```Upload images```
  - the user can choose to upload images with captions if he/she has logged in

## Installing the project

### 1. Install prerequisites
* [Docker](https://www.docker.com/products/docker-desktop)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
* [Eksctl](https://eksctl.io/introduction/installation/)
* [Travis CI](travis-ci.com)

### 2. Clone / download project and set up images / Kubernetes

Clone the project repo: ```git clone https://github.com/tamasdinh/image-microservice```

```cd``` into the cloned project folder, then rename the .env_SAMPLE file to .env and fill in the necessary data. Then go to ```udacity-c3-deployment/k8s``` and edit the same data in the ```aws-secret.yaml```, ```env-configmap.yaml``` and ```env-secret.yaml``` configuration files.

After the above, you can simply run ```bash build.sh``` from the project root folder, which handles your environment variables, builds the Docker images, pushes the Docker images to your Docker Hub repo, creates the control plane on AWS EKS and configures the pods.

Afterwards you can run
```bash
kubectl get all
```
which will show you in the terminal all pods, deployments and services in your newly created Kubernetes cluster.

### 3. Using the app

If you wish to try the app via the Kubernetes deployment, you can simply port-forward the frontend and the reverse-proxy services by running
```sh
kubectl port-forward service/frontend 8100:8100
kubectl port-forward service/reverseproxy 8080:8080
```
and then you can open
```
http://localhost:8100
```
in your browser, which will give you the frontend. The frontend is configured to look for backend services on ```localhost:8080``` where the ```backend-feed``` and ```backend-user``` services have been port-forwarded via the ```reverseproxy``` service.

Alternatively, you can try the local Docker implementation by ```cd```-ing into ```udacity-c3-deployment/docker``` and running
```bash
docker-compose up
``` 
(you have previously built the Docker images so no building step is required here).

### 4. Set up Travis CI tool

If you wish, you can also add CI/CD functionality to the project easily by integrating ```Travis CI``` with your ```GitHub``` repo.

First, create a ```Github``` repo with the downloaded project pack (or alternatively, fork my repo). Then go to [Travis CI](travis-ci.com) and follow the instructions to integrate ```Travis CI``` with your ```GitHub``` repo. The necessary configuration file is already included in the project root folder (```travis.yml```), so without doing anything else, you can effectuate automatic builds via ```Travis CI``` whenever you make a new commit to your ```GitHub``` repo.

```ENJOY!!!```

## Built With

* [Docker](https://reactjs.org) - An excellent, state-based UI framework for Javascript, developed and open-sourced by the Facebook UI Team
* [Kubernetes](https://reacttraining.com/react-router/web/guides/quick-start) - Browser routing for React apps
* [eksctl](https://redux.js.org) - A Predictable State Container for JS Apps
* [AWS Elastic Kubernetes Service (EKS)](https://www.google.com/chrome) - Probably you already heard of it... Has incredibly useful developer tools built-in, including React Component Profiler.

## Authors

* **Tamas Dinh** - [LinkedIn profile](https://www.linkedin.com/in/tamasdinh/)
