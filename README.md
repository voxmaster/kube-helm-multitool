# Kubernetes Helm Multi-Tool 
Source: https://gitlab.com/voxsoft/tools/kube-helm-multitool  
[![build passing](https://gitlab.com/voxsoft/tools/kube-helm-multitool/badges/master/pipeline.svg)](https://gitlab.com/voxsoft/tools/kube-helm-multitool/-/pipelines)
[![dockerhub-voxsoft-deprecated](https://img.shields.io/docker/pulls/voxsoft/kube-helm-multitool.svg)](https://hub.docker.com/r/voxsoft/kube-helm-multitool)
[![dockerhub-voxmaster](https://img.shields.io/docker/pulls/voxmaster/kube-helm-multitool.svg)](https://hub.docker.com/r/voxmaster/kube-helm-multitool)

Registries:
- [DockerHub](https://hub.docker.com/r/voxmaster/kube-helm-multitool): `docker pull voxmaster/kube-helm-multitool`
- [GitLab](https://gitlab.com/voxsoft/tools/kube-helm-multitool/container_registry): `docker pull registry.gitlab.com/voxsoft/tools/kube-helm-multitool`

## About this project
Just another container image that contains all required for typical kubernetes/helm build and deployment.  
Inspired by https://github.com/lwolf/helm-kubectl-docker

The idea is to bring all tools that required by typical kubernetes build and deploy process into one container image that will be updated automatically if a new version of kubectl or helm is released

Container images are built daily

### Main Image
The main image contain:
- kubectl
- helm
- bash
- curl
- envsubst
- git
- jq (>28.12.2020)


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
|v1.26.3-v3.11.2            |v1.26.3              |v3.11.2            | none |
|v1.26-v3.11                |v1.26 (latest patch) |v3.11 (latest patch)| none |
|v1.26-v3                   |v1.26 (latest patch) |v3 (latest minor)  | none |
|v1.26.6-v3.11.2-aws-docker |v1.26.3              |v3.11.2            | `aws-cli` and `docker-cli` |
|v1.26-v3.11-gcloud         |v1.26 (latest patch) |v3.11 (latest patch)| `gcloud-cli` |
|aws                        |(latest)             |(latest)           | `aws-cli` |
|aws-docker                 |(latest)             |(latest)           | `aws-cli` and `docker-cli` |
|gcloud                     |(latest)             |(latest)           | `gcloud-cli` |

### Changelog:
23.03.2023
- FEATURE: Added GitLab Container Registry and Personal DockerHub Registry as a target for image pushing.
- DEPRECATED: DockerHub Teams registry (voxsoft/kube-helm-multitool) will no longer be used for image pushing target in favor of GitLab Container Registry and Personal DockerHub Registry. See the [Docker Free Teams plan changes](https://www.docker.com/blog/we-apologize-we-did-a-terrible-job-announcing-the-end-of-docker-free-teams/) for more details.

25.10.2022
- FIX: CI fixed due to kubectl release page changes
- FIX: Bumped alpine version to 3.16
- FEATURE: Using ezkrg/buildx:latest image for building multi-arch images

28.12.2020
- FIX: `docker-cli` - The problem that not allow using an image in the docker build process on GitLab runners
- FIX: `kubectl` - The image did not have the latest version installed.
- FEATURE: `jq` - Tool included in all images
- FEATURE: `gcloud-cli` Install latest  version on image build
- CI: Implemented possibility to rebuild image using predefined kubectl, helm, gcloud versions

*NOTE: Previous images will not be updated*

# Contributing
Feel free to open an [issue](https://gitlab.com/voxsoft/tools/kube-helm-multitool/-/issues) or create [merge request](https://gitlab.com/voxsoft/tools/kube-helm-multitool/-/merge_requests) to improve this project.
