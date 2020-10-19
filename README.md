# Kubernetes Helm Multi-Tool 

## About this project
Just another container images that contain all required for typical kubernetes/helm build and deploy.  
Inspired by https://github.com/lwolf/helm-kubectl-docker

The idea is to bring all tools that required by typical kubernetes build and deploy process into one container image that will be updated automatically if new version of kubectl or helm are released

Container images are built daily

### Main Image
Main image contain:
- kubectl
- helm
- bash
- curl
- envsubst
- git


### Additional Images
In addition to main image, also additional images are being built each time new kubectl/helm releases come.
- aws-cli
- aws-cli and docker-cli
- docker-cli
- gcloud-cli


### Image Tags Schema
Tag forming example

| Tag                       | Kubectl             | Helm              |  Addition | 
|:--------------------------|:-------------------:|:-----------------:|:---------:|
|v1.18.6-v3.2.4             |v1.18.6              |v3.2.4             | none |
|v1.18-v3.2                 |v1.18 (latest patch) |v3.2 (latest patch)| none |
|v1.18-v3                   |v1.18 (latest patch) |v3 (latest minor)  | none |
|v1.18.6-v3.2.4-aws-docker  |v1.18.6              |v3.2.4             | `aws-cli` and `docker-cli` |
|v1.18-v3.2-gcloud          |v1.18 (latest patch) |v3.2 (latest patch)| `gcloud-cli` |
|aws                        |(latest)             |(latest)           | `aws-cli` |
|aws-docker                 |(latest)             |(latest)           | `aws-cli` and `docker-cli` |
|gcloud                     |(latest)             |(latest)           | `gcloud-cli` |


## TODO
- Force specific version via Gitlab CI/CD Variable
