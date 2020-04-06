# get the base image
FROM rocker/verse

# required
LABEL maintainer="mark@trinetteandmark.com"

# get contents of GitHub repo
COPY . /stormdown

# install and test our package
CMD ["R", "-f", "./stormdown/guidence/cicd.R"]
