
#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image
docker build -t capstone .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run Capstone app
#docker run -it -p 80:8080 --name capstone-container capstone:latest