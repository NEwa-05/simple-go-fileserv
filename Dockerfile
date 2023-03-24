FROM golang:1.19.3 AS builder
WORKDIR /app
COPY fileserv/fileserv.go .
RUN go mod init fileserv
RUN go mod tidy
RUN GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -a -installsuffix cgo -o fileserv .

FROM alpine
WORKDIR /
COPY --from=builder /app/fileserv .
CMD ["./fileserv"]