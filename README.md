# nginx simple reverse proxy

## Usage
1. Copy your certificates to `/etc/nginx/ssl`

```bash
cp fullchain.crt /etc/nginx/ssl/fullchain.crt
cp server.key /etc/nginx/ssl/server.key
```

2. Change the permissions to the `server.key` file

```bash
chmod 400 /etc/nginx/ssl/server.key
```

3. Add the following compose part to your `docker-compose.yml`

```docker
version: "3.7"
services:
    proxy:
        image: dameyerdave/nxsrp:latest
        hostname: proxy
        volumes:
            - /etc/nginx/ssl:/etc/nginx/ssl
        ports: 
            - "443:443"
        networks:
            - <docker-network>
        restart: unless-stopped
        environment:
            - NGINX_SERVER_NAME=${NGINX_SERVER_NAME}
            - BACKEND_URL=${BACKEND_URL}
networks:
    <docker-network>:
```

4. Add a `.env` file with the following content

```bash
NGINX_SERVER_NAME=my.server.domain.com
BACKEND_URL=http://<docker-hostname>:<port>
```

5. Compose the docker

```bash
docker-compose up -d
```

6. __[OR]__ Run it via `docker` command

```bash
docker run
    --name proxy
    --hostname proxy
    --net <docker-network>
    -e NGINX_SERVER_NAME=my.server.domain.com
    -e BACKEND_URL=http://localhost:5000
    -v /etc/nginx/ssl:/etc/nginx/ssl
    -p 443:443
    -it -d
    dameyerdave/nxsrp:latest
```
