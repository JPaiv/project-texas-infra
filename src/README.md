# Flask API app #

Simple flask api made in python to test container deployments.

## Docker ## 

No need to build or push the Docker images, the Github Actions pipeline will take care of that.

## Local development ##

For local development you have to build and run the image locally using following commands:

1. ``` docker build -t flask-api . ```

2. ``` docker run flask-api ```