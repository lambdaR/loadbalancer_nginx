# This image is for testing purposes only

# loadbalancer_nginx
Nginx 1.15.8 offical Docker image configured to serve as A Load Balancer for 2 http_nginx instances.

To create your own self-singed cer and key:
```bash
openssl req -x509 -nodes -newkey rsa:4096 -keyout your_key_name.pem -out your_cert_name.pem -days 365
```

To run it do:

```bash
docker network create --driver bridge mybridge
docker container run --name webserverone --detach --network mybridge djoudat/http_nginx
docker container run --name webservertwo --detach --network mybridge djoudat/http_nginx
docker container run --name loadbalancer --detach --network mybridge --publish 80:80 djoudat/loadbalancer_nginx
```





