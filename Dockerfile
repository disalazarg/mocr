# Build container
FROM crystallang/crystal:1-alpine AS build

RUN mkdir -p /src
WORKDIR /src

COPY . /src
RUN shards install
RUN shards build --release --static

# Runtime container
FROM alpine:latest

RUN apk add --update \
    bash \
    libc6-compat \
    lsof \
    openssl

RUN mkdir -p /app
WORKDIR /app

COPY --from=build /src/config.yml /src/bin/mocr ./

EXPOSE 3000

CMD ["./mocr", "-f", "/src/config.yml"]
