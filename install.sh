#!/usr/bin/env bash

set -e

NANOSERVICE_VERSION=${NANOSERVICE_VERSION:-"v0.1"}
PREFIX=${PREFIX:-"/usr/local"}

OS=$(uname)
ARCH=$(uname -m)

if [[ "$OS" = "Darwin" ]]; then
  OS_VERSION=darwin
else
  OS_VERSION=linux
fi

if [[ "$ARCH" = "x86_64" ]]; then
  ARCH_VERSION=amd64
else
  ARCH_VERSION=386
fi

NANOSERVICE_URL="https://github.com/nanoservice/nanoservice/releases/download/${NANOSERVICE_VERSION}/nanoservice-${OS_VERSION}-${ARCH_VERSION}"

sudo mkdir -p ${PREFIX}/bin/
curl -L ${NANOSERVICE_URL} | sudo tee ${PREFIX}/bin/nanoservice >/dev/null
sudo chmod a+x ${PREFIX}/bin/nanoservice
