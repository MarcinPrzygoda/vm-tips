# Unpack `tar.gz`

```bash
# Binary
VERSION="X.X.X"; BINARY="X"; curl -Lo "${BINARY}.tar.gz" "https://github.com/binary/binary/releases/download/v${VERSION}/${BINARY}.tar.gz" && tar -xzf "${BINARY}.tar.gz" -C "/usr/local/bin" && chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar.gz"

# Directory
VERSION="X.X.X"; DIRECTORY="X"; curl -Lo "${DIRECTORY}.tar.gz" "https://github.com/directory/directory/releases/download/v${VERSION}/${DIRECTORY}.tar.gz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
```

# Unpack `tar`

```bash
# Binary
VERSION="X.X.X"; BINARY="X"; curl -Lo "${BINARY}.tar" "https://github.com/binary/binary/releases/download/v${VERSION}/${BINARY}.tar" && tar -xf "${BINARY}.tar" -C "/usr/local/bin" && chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar"

# Directory
VERSION="X.X.X"; DIRECTORY="X"; curl -Lo "${DIRECTORY}.tar" "https://github.com/directory/directory/releases/download/v${VERSION}/${DIRECTORY}.tar" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xf "${DIRECTORY}.tar" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar"
```

# Remote `bash.sh`

```bash
curl -s https://bash.sh | bash
```