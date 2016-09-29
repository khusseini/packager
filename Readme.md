Packager
===

Create minimal "packages" for use in Docker.

Example:
-
Requirements: Clone repository
```bash
docker build -t packager .

CID=$(cat nginx_conf.json | docker run -ia stdin -v "${PWD}/build":/tmp/build packager)
docker logs -f "${CID}"
# Wait for the process to finish

sudo chmown -R [youruser]:[yourgroup] ./build/
cd build/
docker build -t nginx .

docker run -d -p 8080:80 nginx /usr/bin/nginx -g 'daemon off;'

curl -v http://localhost:8080
```

E voila, an nginx image that is not even 50MB small :)

Configuration:
-
```
{
    "essentials": [...] # List of essential binaries, like chmod, or ls
    "packages": [...]   # Apt packages to install
    "bin": [...]        # Binaries to extract e.g. nginx (no full path, only binary name)
}
```
