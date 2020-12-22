FROM golang:1.15-alpine as builder
WORKDIR /work
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /app .

FROM scratch
COPY --from=builder /app /
ENTRYPOINT ["/app"]
