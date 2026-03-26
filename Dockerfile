# ------------------------- 
# Stage 1: Build Stage      
# ------------------------- 
FROM node:18 AS builder     

# Create working directory  
WORKDIR /app

# Copy dependency file first
COPY package.json .

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# -------------------------
# Stage 2: Production Stage
# -------------------------
FROM node:18-alpine

# Create working directory
WORKDIR /app

# Copy only required files from builder
COPY --from=builder /app /app

# Expose application port
EXPOSE 3000

# Start application
CMD ["node", "app.js"]
