#!/bin/bash

./build.sh

rm -f bubblequack-ggj2025.zip

mkdir -p ggj-release/source ggj-release/other
cp LICENSE ggj-release/
cp CREDITS.md ggj-release/other
cp -r -- * ggj-release/source
rm -rf ggj-release/source/ggj-release

(
	cd ggj-release/ || exit

	mv source/dist/ release

	cp -r source/assets/screenshots/ press/

	zip -r ../bubblequack-ggj2025.zip .
)

rm -r ggj-release/
