FROM python:3.12-slim

RUN apt-get update && apt-get install -y git \
    && pip install --no-cache-dir PyYAML \
    && rm -rf /var/lib/apt/lists/*

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
