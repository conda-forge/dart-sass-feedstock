#!/usr/bin/env bash
set -eux

if [ "$SUBDIR" == "osx-arm64" ]; then
    # binary repack on Apple Silicon because build machines only support that via
    #     cross compiling right now
    mkdir -p $PREFIX/bin
    cp sass $PREFIX/bin
    cp -r src $PREFIX/bin
else
    dart pub get
    dart compile exe --define="version=${PKG_VERSION}" bin/sass.dart -o $PREFIX/bin/sass
fi
