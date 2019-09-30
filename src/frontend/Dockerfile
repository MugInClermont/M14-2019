FROM nginx:latest
 
# Copy web site
COPY ./build/web/ /usr/share/nginx/html

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80