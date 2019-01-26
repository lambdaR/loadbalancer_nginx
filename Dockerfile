FROM nginx:1.15.8

# copy certificate and key
COPY ./mycert_123.pem /root/mycert_123.pem
COPY ./mykey_123.pem /root/mykey_123.pem

# Delete all config files in conf.d folder
RUN rm /etc/nginx/conf.d/*

# Copy file to conf.d folder
COPY myconfig.conf /etc/nginx/conf.d/

# Copy two config files to root
#COPY myconfig_classic.conf /etc/nginx
#COPY myconfig_swarm.conf /etc/nginx

# update apt-get and install curl
RUN apt-get update && apt-get install -y curl

# heathchek -- when starting wait for 10s then every 5m do check.
HEALTHCHECK --interval=300s --timeout=3s --retries=2 --start-period=10s CMD curl -f http://localhost/ || exit 1
