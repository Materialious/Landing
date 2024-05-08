FROM node AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Copy the rest of the project files to the working directory
COPY . .

# Install dependencies and build the project
RUN npm install && npm run build

FROM nginx:alpine

# Remove the default nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy the nginx.conf file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the built Vite project from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose the desired port
EXPOSE 80

# Replace env vars & Start nginx
CMD ["/bin/sh", "-c", "nginx -g \"daemon off;\""]