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
    chmod +x /usr/local/bin/kubectl && \
    mkdir -p /certs/client

COPY --from=docker:stable /usr/local/bin/docker /usr/local/bin/docker
ENV DOCKER_TLS_CERTDIR=/certs
ENV DOCKER_HOST=tcp://docker:2375

CMD ["docker"]
