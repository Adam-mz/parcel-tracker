
FROM golang:1.23 as builder

WORKDIR /app

COPY . .

RUN go build -o app main.go

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/app .

CMD ["./app"]
