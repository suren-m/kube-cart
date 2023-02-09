# export DOCKER_BUILDKIT=0
# export COMPOSE_DOCKER_CLI_BUILD=0

FROM alpine:3.17.0
LABEL org.opencontainers.image.source https://github.com/suren-m/kube-cart

ARG PB_VERSION=0.10.4

RUN apk add --no-cache \
    unzip \
    ca-certificates

# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080
EXPOSE 443

# start PocketBase
WorkDir /pb
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8080"]

# CMD ["sh", "/pb/pocketbase serve --http=0.0.0.0:8080 --https=0.0.0.0:443"]
# ENTRYPOINT ["/pb/pocketbase serve --http=0.0.0.0:8080"]