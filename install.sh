#!/usr/bin/env bash
set -e

PACKAGE_NAME=$(sed -n 's/^name = "\(.*\)"/\1/p' typst.toml)
PACKAGE_VERSION=$(sed -n 's/^version = "\(.*\)"/\1/p' typst.toml)

TARGET_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local/${PACKAGE_NAME}/${PACKAGE_VERSION}"

echo "Installing package '@local/${PACKAGE_NAME}:${PACKAGE_VERSION}'..."
echo "Target directory: ${TARGET_DIR}"

mkdir -p "${TARGET_DIR}"

cp -r typst.toml lib.typ assets template "${TARGET_DIR}"

echo "Installation complete!"
echo "You can now use #import \"@local/${PACKAGE_NAME}:${PACKAGE_VERSION}\": report in any Typst file."

