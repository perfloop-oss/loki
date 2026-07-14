FROM golang:1.26.5@sha256:079e59808d2d252516e27e3f3a9c003740dee7f75e55aa71528766d52bcfc16a
ENV CGO_ENABLED=0
RUN go install github.com/go-delve/delve/cmd/dlv@v1.26.3

FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

RUN     mkdir /loki
WORKDIR /loki
ADD     ./loki ./
ADD     ./.src ./src
COPY --from=0 /go/bin/dlv ./
