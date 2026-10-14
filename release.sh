#!/bin/bash
# Bump APP_VERSION and stamp APP_BUILD (Pacific time) in index.html. Run before each release commit.
set -e; cd "$(dirname "$0")"
n=$(grep -o "const APP_VERSION=[0-9]*" index.html | grep -o "[0-9]*$"); n=$((n+1))
b=$(TZ=America/Vancouver date +%Y-%b-%d:%H:%M)
sed -i "s/const APP_VERSION=[0-9]*;/const APP_VERSION=$n;/; s/const APP_BUILD='[^']*';/const APP_BUILD='$b';/" index.html
echo "Version $n · $b"
