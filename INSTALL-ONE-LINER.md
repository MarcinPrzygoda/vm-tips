# Remote `bash.sh`

```bash
curl -s https://bash.sh | bash
```

# Remote binary

```bash
VERSION="X.X.X"; BINARY="X"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/binary/binary/releases/download/v${VERSION}/binary" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

# Remote `tar.gz`

```bash
VERSION="X.X.X"; DIRECTORY="X"; curl -Lo "${DIRECTORY}.tar.gz" "https://github.com/directory/directory/releases/download/v${VERSION}/${DIRECTORY}.tar.gz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
```

# Remote `tar`

```bash
VERSION="X.X.X"; DIRECTORY="X"; curl -Lo "${DIRECTORY}.tar" "https://github.com/directory/directory/releases/download/v${VERSION}/${DIRECTORY}.tar" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xf "${DIRECTORY}.tar" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar"
```