FROM golang:1.16.12-alpine3.15 as builder

WORKDIR /app

COPY . .

RUN go build -ldflags="-s -w" -o main main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD ["/app/main"]