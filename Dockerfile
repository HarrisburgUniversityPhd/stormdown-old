# get the base image
FROM rocker/verse

# required
LABEL maintainer="mark@trinetteandmark.com"

# get contents of GitHub repo
COPY . /stormdown

# go into the repo directory
RUN . /etc/environment \
&& sudo apt-get update \
&& R -e "devtools::install('/stormdown', dep = T, upgrade = 'never')" \
&& R -f "/stormdown/guidence/cicd.R"
