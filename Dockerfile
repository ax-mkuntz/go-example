FROM golang:1.19-bullseye AS builder

WORKDIR /work

# ENV GONOSUMDB="redacted"
ARG ARTIFACTORY_URL

COPY go.mod go.sum /work/


RUN --mount=type=secret,id=ARTIFACTORY_USER \
    --mount=type=secret,id=ARTIFACTORY_PASSWORD \
    export GOPROXY="https://$(cat /run/secrets/ARTIFACTORY_USER):$(cat /run/secrets/ARTIFACTORY_PASSWORD)@${ARTIFACTORY_URL}" && \
    echo "$GOPROXY" && \
    go mod download && \
    unset GOPROXY


COPY main.go /work/
RUN go run main.go