docker run --rm alpine:latest sh -c \
"apk add --no-cache curl jq > /dev/null \
&& curl -sS https://api.github.com/repos/moby/buildkit/releases | \
    jq -r '.[].assets[].browser_download_url' | \
    grep linux-amd64 | head -n 1 | xargs curl -sSL" | \
sudo tar zxf - -C /usr/local/
