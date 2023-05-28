FROM golang:1.20.4-alpine3.16 as builder

WORKDIR /src
ADD . /src
RUN go build -o app -ldflags="-s -w" ./cmd/main.go


FROM scratch as executer
COPY --from=builder /src/app .

ENTRYPOINT ["./app"]