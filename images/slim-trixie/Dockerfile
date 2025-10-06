FROM debian:trixie-slim

LABEL org.opencontainers.image.source=https://github.com/veryl-lang/docker

ENV VERYLUP_HOME=/usr/local/verylup \
    PATH=/usr/local/verylup/bin:$PATH \
    VERYL_VERSION=

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        unzip \
        wget \
        ; \
    dpkgArch="$(dpkg --print-architecture)"; \
    case "${dpkgArch##*-}" in \
        amd64) arch='x86_64'; verylupSha256='2c46735d0dc6c28b8de524b8d8239a2c8b70d62584bbb3c6a0b96224916a6d8a' ;; \
        arm64) arch='aarch64'; verylupSha256='370af3edda00ec147dd81714683d19ab09d12026c6fcc8011f99f3e05f9752d0' ;; \
        *) echo >&2 "unsupported architecture: $apkArch"; exit 1 ;; \
    esac; \
    url="https://github.com/veryl-lang/verylup/releases/download/v0.1.9/verylup-${arch}-linux.zip"; \
    wget "$url"; \
    echo "${verylupSha256} verylup-${arch}-linux.zip" | sha256sum -c -; \
    unzip verylup-${arch}-linux.zip; \
    mkdir -p $VERYLUP_HOME/bin; \
    mv verylup $VERYLUP_HOME/bin; \ 
    rm verylup-${arch}-linux.zip; \
    verylup setup --toolchain $VERYL_VERSION; \
    chmod -R a+w $VERYLUP_HOME; \
    verylup --version; \
    veryl --version; \
    apt-get remove -y --auto-remove \
        unzip \
        wget \
        ; \
    rm -rf /var/lib/apt/lists/*;
