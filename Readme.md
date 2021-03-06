Packager
===

Create minimal docker images for applications based on Ubuntu packages

Example:
-

```bash
git clone git@github.com:mozzymoz/packager.git
cd packager/
docker build -t packager .
cat examples/nginx.json | docker run --name pckgr -ia stdin -a stdout -a stderr packager > build.tar
cat build.tar | docker import - nginx
docker run -d -p 8080:80 nginx /usr/sbin/nginx -g 'daemon off;'
curl -v http://localhost:8080
```

The resulting nginx images is less than 50MB small

Configuration:
-
```
{
    "pre-commands": [...]        # List of bash commands to execute before build
    "post-commands": [...]       # List of bash commands to execute after build  
    "essentials": [ln, rm, ....] # List of essential binaries, like cp, mv ...
    "packages": [...]            # Apt packages to install
    "bin": [...]                 # Binaries to extract e.g. nginx or /usr/sbin/nginx
}
```
