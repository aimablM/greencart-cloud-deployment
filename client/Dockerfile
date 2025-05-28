
# 1. Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Accept env var from build args
ENV VITE_BACKEND_URL=http://192.168.0.23:4000

# Install dependencies first (optimized layer caching)
COPY package.json package-lock.json* pnpm-lock.yaml* yarn.lock* ./
RUN npm install

# Copy all source files
COPY . .

# Build the app
RUN npm run build

# 2. Production stage
FROM nginx:stable-alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy built assets from builder stage
COPY --from=builder /app/dist .

# Replace default nginx config with our custom one
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
