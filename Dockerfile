
# Use an official Node.js image as the base
FROM node:14

# Create and set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY app/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY app/ .

# Expose the application port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
