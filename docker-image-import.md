# Import Custom Images to Docker

## Import .TAR images
```
docker image import CUSTOM-IMAGE.tar IMAGE-TAG-NAME:VERSION
```
- Example:
```
docker image import Rocky-8-Container-Base.latest.x86_64.tar rockylinux:8.9
```

---
## Tag image to Push to Docker Hub
```
docker IMAGE-TAG-NAME:VERSION DOCKER-HUB-REPO/IMAGE-TAG-NAME:VERSION
```
- Example:
```
docker tag rockylinux:8.9 atomycloud/base/rockylinux:8.9
```
- Push
```
docker push DOCKER-HUB-REPO/IMAGE-TAG-NAME:VERSION
```
Example:
```
docker push atomycloud/rockylinux:8.9
```


---
## Export Images from Docker Images
```
docker save -o IMAGE-NAME.tar IMAGE-NAME:VERSION
```
- Example:
```
docker save -o nginx.tar nginx:1.0
```

---
## Export Images from Docker Containers
```
docker export IMAGE-NAME:VERSION > IMAGE-NAME.tar
```
- Example:
```
docker export nginx:1.0 > nginx.tar
```