#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t react_app:latest .

# Step 2: 
# List docker images
docker images ls

# Step 3: 
# Run react application
docker run -t -i -p 8080:3000 react_app:latest