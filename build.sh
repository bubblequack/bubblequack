#!/usr/bin/env bash

set -e

rm -rf dist/
mkdir -p dist

CLI="docker run --rm -ti -v $PWD:/app -w /app -u "$UID:$GID" ghcr.io/bubblequack/gb-studio-cli-docker gb-studio-cli"

echo 'Building for GameBoy Color ...'
$CLI make:rom bubblequack.gbsproj dist/bubblequack.gbc
echo 'done.'

echo 'Building for Analogue Pocket ...'
$CLI make:pocket bubblequack.gbsproj dist/bubblequack.pocket
echo 'done.'

echo 'Building for web ...'
$CLI make:web bubblequack.gbsproj dist/web
echo 'done.'
