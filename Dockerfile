FROM golang:1.17-alpine AS builder

WORKDIR /go/src/app

COPY . .

RUN go mod download

RUN go build -o /go/bin/app .

FROM alpine:latest

COPY --from=builder /go/bin/app /app

CMD ["/app"]