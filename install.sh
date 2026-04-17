#!/usr/bin/env bash
set -euo pipefail

RELEASE_URL="https://github.com/silentg33k/chalkboard-installer/raw/main/releases/chalkboard-v1.0.0-rc1-linux.zip"
STAGE="/home/pi/chalkboard-upload"
ARCHIVE="/tmp/chalkboard-v1.0.0-rc1.zip"

if [ "$(id -u)" -eq 0 ]; then
  echo "Run this installer as user pi, not as root." >&2
  exit 1
fi

if [ "$(id -un)" != "pi" ]; then
  echo "This RC1 installer expects the Raspberry Pi user to be named pi." >&2
  echo "Current user: $(id -un)" >&2
  exit 1
fi

echo "Installing download prerequisites..."
sudo apt update
sudo apt install -y ca-certificates curl unzip

echo "Preparing staging directory: $STAGE"
mkdir -p "$STAGE"
rm -rf "$STAGE"/*

echo "Downloading Chalkboard RC1 package..."
curl -fL "$RELEASE_URL" -o "$ARCHIVE"

echo "Extracting package..."
unzip -q "$ARCHIVE" -d "$STAGE"

if [ ! -f "$STAGE/index.php" ]; then
  echo "Package extraction failed: $STAGE/index.php is missing." >&2
  exit 1
fi

if [ ! -f "$STAGE/chalkboard-screen-schedule.helper" ]; then
  echo "Package extraction failed: $STAGE/chalkboard-screen-schedule.helper is missing." >&2
  exit 1
fi

if [ ! -f "$STAGE/install-chalkboard-pi.sh" ]; then
  echo "Package extraction failed: $STAGE/install-chalkboard-pi.sh is missing." >&2
  exit 1
fi

chmod +x "$STAGE/install-chalkboard-pi.sh"

echo "Starting Chalkboard Pi installer..."
exec "$STAGE/install-chalkboard-pi.sh"
