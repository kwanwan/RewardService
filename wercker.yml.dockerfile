box: node:6
build:
  steps:
    - internal/docker-build:
        dockerfile: Dockerfile
        image-name: pointscollection
    - internal/docker-push:
        image-name: pointscollection
        username: $DOCKER_USER
        password: $DOCKER_PASSWORD
        repository: $DOCKER_REPO
        registry: $DOCKER_REGISTRY
        tag: $WERCKER_GIT_COMMIT
        ports: 8080

deploy:
  box:
    id: alpine
    cmd: /bin/sh
  steps:
    - bash-template

    - kubectl:
        name: apply namespace
        server: $KUBERNETES_MASTER
        token: $KUBERNETES_TOKEN
        insecure-skip-tls-verify: true
        command: apply -f ./ns.yml
    - kubectl:
        name: delete OCR secret
        server: $KUBERNETES_MASTER
        token: $KUBERNETES_TOKEN
        insecure-skip-tls-verify: true
        command: delete secret wrelease --namespace=$NS --ignore-not-found=true
    - kubectl:
        name: create OCR secret
        server: $KUBERNETES_MASTER
        token: $KUBERNETES_TOKEN
        insecure-skip-tls-verify: true
        command: create secret docker-registry wrelease --docker-server=$DOCKER_REGISTRY --docker-username=$DOCKER_USER --docker-password="$DOCKER_PASSWORD" --docker-email=${WERCKER_APPLICATION_OWNER_NAME}@mail.com --namespace=$NS
    - kubectl:
        name: apply deplyoment
        server: $KUBERNETES_MASTER
        token: $KUBERNETES_TOKEN
        insecure-skip-tls-verify: true
        command: apply -f ./pointscollection-deploy.yml --namespace=$NS
    - kubectl:
        name: apply service
        server: $KUBERNETES_MASTER
        token: $KUBERNETES_TOKEN
        insecure-skip-tls-verify: true
        command: apply -f ./pointscollection-service.yml --namespace=$NS
