FROM nginx:1.15.8

# copy certificate and key
COPY ./mycert_123.pem /root/mycert_123.pem
COPY ./mykey_123.pem /root/mykey_123.pem

# Applying new config file
RUN rm /etc/nginx/conf.d/*
COPY myconfig.conf /etc/nginx/conf.d/

# heathchek -- when starting wait for 10s then every 5m do check.
HEALTHCHECK --interval=300s --timeout=3s --retries=2 --start-period=10s CMD curl -f http://localhost/ || exit 1