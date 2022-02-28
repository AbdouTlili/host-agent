#syntax=docker/dockerfile:1

FROM golang:1.16-buster

WORKDIR /app

COPY go.mod /app/
COPY go.sum /app/

RUN go mod download

COPY *.go /app/

RUN go build -o /server

EXPOSE 8080

CMD ["/server"]