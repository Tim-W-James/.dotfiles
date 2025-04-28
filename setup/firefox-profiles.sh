#!/bin/sh
BASE_DIR="$HOME/snap/firefox/common"
BIN_INSTALL_DIR="$BASE_DIR/firefoxprofileswitcher-install"
MANIFEST_INSTALL_DIR="$BASE_DIR/.mozilla/native-messaging-hosts"
DOWNLOAD_URL="https://github.com/null-dev/firefox-profile-switcher-connector/releases/latest/download/linux-x64.deb"

# Download and install the binary
mkdir -p "$BIN_INSTALL_DIR"
TMP_FILE="$(mktemp)"
curl -L "$DOWNLOAD_URL" -o "$TMP_FILE"
ar p "$TMP_FILE" data.tar.xz | tar xfJ - --strip-components=2 -C "$BIN_INSTALL_DIR" usr/bin/ff-pswitch-connector
rm "$TMP_FILE"

# Install the manifest (used by Firefox to locate the binary)
mkdir -p "$MANIFEST_INSTALL_DIR"
echo '
{
    "allowed_extensions": [
        "profile-switcher-ff@nd.ax"
    ],
    "description": "Profile Switcher for Firefox",
    "name": "ax.nd.profile_switcher_ff",
    "path": "'"$BIN_INSTALL_DIR"'/ff-pswitch-connector",
    "type": "stdio"
}
' > "$MANIFEST_INSTALL_DIR/ax.nd.profile_switcher_ff.json"