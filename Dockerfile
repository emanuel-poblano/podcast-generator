FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    gcc \
    libyaml-dev \
    git \
    && pip3 install --no-cache-dir PyYAML \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
