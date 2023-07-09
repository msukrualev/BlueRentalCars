# Use a base image with Node.js installed
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies docker tag <image-id> <username>/<repository>:<tag>

RUN npm install

# Copy the entire project to the working directory
COPY . .

# update browserlist database
RUN npx browserslist@latest --update-db

# Build the React app
RUN npm run build

# Set the production environment variable
ENV NODE_ENV=production

# Expose the desired port
EXPOSE 3000

# Start the React app
CMD ["npm", "start"]

