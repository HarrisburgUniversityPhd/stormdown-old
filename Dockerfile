# get the base image
FROM rocker/verse:3.6.3

# required
LABEL maintainer="mark@trinetteandmark.com"

RUN install2.r -e -d TRUE -r https://mran.microsoft.com/snapshot/2020-06-24 \
    rmarkdown bookdown tinytex devtools kableExtra dplyr ggpubr

# get contents of GitHub repo
COPY . /stormdown

# install and test our package
CMD ["R", "-f", "./stormdown/guidence/cicd.R"]
