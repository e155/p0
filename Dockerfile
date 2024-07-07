FROM golang as builder
WORKDIR /src
COPY  src .
RUN CGO_ENABLED=1 go build -o app

FROM scratch
ADD ./html /html
COPY --from=builder /src/app .
ENTRYPOINT [ "./app" ]
EXPOSE  8080