#!/usr/bin/env bash
set -eux

dart pub get
dart run grinder protobuf
dart compile exe --define="version=${PKG_VERSION}" bin/sass.dart -o ${PREFIX}/bin/sass
