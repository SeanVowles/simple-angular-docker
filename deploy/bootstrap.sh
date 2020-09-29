#!/bin/bash
echo $(date) # Will print the output of date command
echo 'This is a one time script to build and bootstrap an Angular app in docker'

# build the image
docker-compose build

# output list of images
docker image ls

# create a container, new up an angular app then delete the container as it'll have a guid or similar as part of the
# name
# The volume in the docker-compose.yml is a configured bind mount so these files will be 'saved' to the host machine
# also
docker-compose run --rm front-end ng new --directory=./ --skip-install front-end

# Do similar - create the container, run npm install so you have all the modules then bin the container
docker-compose run --rm front-end npm install
