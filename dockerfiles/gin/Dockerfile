# docker build -t harbor.k8s/library/k8s-golang:v1.0 --build-arg GO_VERSION=1.15 .
ARG GO_VERSION=1.19

FROM golang:${GO_VERSION}-alpine AS builder

RUN go env -w GO111MODULE=on
RUN go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/

WORKDIR /go/build
COPY ../ .
RUN go mod download
RUN go build -o ./app cmd/server/main.go


FROM alpine:latest

RUN mkdir -p /app
WORKDIR /app
COPY --from=builder /go/build/app /app

EXPOSE 8080

ENTRYPOINT ["./app"]