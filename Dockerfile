# ------------------------------------------------------------------------------
# STAGE 1: Builder
# Uses your cached base image to speed up compilation
# ------------------------------------------------------------------------------
FROM ghcr.io/junghunleephd/hs-template-env:latest AS builder

WORKDIR /opt/build

# Copy project definition first
COPY stack.yaml package.yaml ./

# Build dependencies
RUN stack build --system-ghc --only-dependencies

# Copy source and build app
COPY app app
RUN stack install --system-ghc --ghc-options='-O2'
# ------------------------------------------------------------------------------
# STAGE 2: Runner
# Tiny image for distribution
# ------------------------------------------------------------------------------
FROM debian:bullseye-slim

WORKDIR /opt/app

# Fix for Debian 10 EOL (Optional if you are using Bullseye, but safe to keep)
RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list \
    && echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99no-check-valid-until

# Install Runtime Dependencies
RUN apt-get update && apt-get install -y \
    libgmp10 \
    netbase \
    ca-certificates \
    zlib1g \
    libssl1.1 \
    && rm -rf /var/lib/apt/lists/*

# Copy the binary
COPY --from=builder /home/vscode/.local/bin/my-haskell-webapp-exe /opt/app/server

# --- NEW: Copy the static folder ---
COPY static /opt/app/static
# -----------------------------------

ENV PORT=3000
EXPOSE 3000

CMD ["/opt/app/server"]