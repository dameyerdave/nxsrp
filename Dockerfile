FROM nginx:latest
VOLUME /etc/nginx/ssl
RUN mkdir -p /app/static
#COPY favicon.ico /app/static/.
#COPY index.html /app/static/.
COPY nginx.conf /etc/nginx/nginx.conf.template
COPY ./entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]
WORKDIR /
ENV NGINX_SERVER_NAME myserver.domain.com
ENV BACKEND_URL http://localhost:5000
ENTRYPOINT ./entrypoint.sh
