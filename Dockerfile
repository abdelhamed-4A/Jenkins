FROM alpine:latest

# Install Nginx and Curl
RUN apk update && apk add --no-cache nginx curl

# Ensure the HTML directory exists
RUN mkdir -p "/usr/share/nginx/html/"

# Add custom message to index.html
RUN echo "Abdel-Hamed  --->  DevOps Engineer" > "/usr/share/nginx/html/index.html"

# Expose port 80
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
