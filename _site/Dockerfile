FROM nginx:latest

# copy the nginx conf
RUN rm /etc/nginx/conf.d/default.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

# copy the static files
COPY _site /usr/share/nginx/html

# expose the port
EXPOSE 20020