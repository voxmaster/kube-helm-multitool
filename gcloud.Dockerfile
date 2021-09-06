FROM alpine:3.12

LABEL maintainer="Oleksii Marchenko <oleksi.marchenko@gmail.com>"

ARG K8S_VERSION
ARG HELM_VERSION

RUN apk add --no-cache --update \
    bash \
    ca-certificates \
    curl \
    git \
    gettext \
    jq \
    tar \
    gzip && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 && \
    chmod +x /usr/local/bin/kubectl

ARG CLOUD_SDK_VERSION
ENV PATH /google-cloud-sdk/bin:$PATH

RUN apk --no-cache add \
    python3 \
    py3-crcmod \
    libc6-compat \
    openssh-client \
    gnupg && \
    curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version

CMD ["gcloud"]
