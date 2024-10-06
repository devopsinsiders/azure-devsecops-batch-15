#!/bin/bash

# Loop to create 25 Nginx containers
for i in $(seq 1 30); do
  container_name="nginx_$i"
  
  echo "Creating container: $container_name"
  
  # Run the Nginx container with a unique name
  docker run -d --name $container_name nginx
  
  # Optionally, you can add some logs or output to indicate success/failure
  if [ $? -eq 0 ]; then
    echo "Successfully created container: $container_name"
  else
    echo "Failed to create container: $container_name"
  fi
done
