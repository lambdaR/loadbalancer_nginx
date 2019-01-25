# This image is for testing purposes only

# loadbalancer_nginx
Nginx 1.15.8 offical Docker image configured to serve as A Load Balancer for 3 http_nginx instances.

To create your own self-singed cer and key:
```bash
openssl req -x509 -newkey rsa:4096 -keyout your_key_name.pem -out your_cert_name.pem -days 365
```


