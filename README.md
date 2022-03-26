# docker-privoxy-nordvpn
This repo contains a privoxy/nordvpn docker container. 

## Downloading the image
The first step is to pull the image.
```bash
docker pull busybox42/docker-privoxy-nordvpn:tagname
```
## Creating the container
Now that we have the image busybox42/haraka-docker-centos we can create the container with a few parameters.
```bash
docker run -d --device=/dev/net/tun --cap-add=NET_ADMIN \
    --name=privoxy-nordvpn
    --dns=103.86.96.100 --dns=103.86.99.100 \
    -e "REGION=us1742" \
    -e "PROTOCOL=tcp" \
    -e "USERNAME=someone" \
    -e "PASSWORD=something" \
    -e "LOCAL_NETWORK=192.168.1.0/24" \
    -p 8118:8118 \
    busybox42/docker-privoxy-nordvpn
```

## Kubernetes deployment
I've included a template to run in kubernetes. Configure how you'd like and run:
```bash
kubectl apply -f k8s/privoxy-nordvpn.yml
```
