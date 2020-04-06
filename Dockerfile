# get the base image
FROM rocker/verse

# required
LABEL maintainer="mark@trinetteandmark.com"

# get contents of GitHub repo
COPY . /stormdown

# get wget so we can load fonts
RUN sudo apt-get update && sudo apt-get install wget

# get the 3 fonts we use
RUN sudo wget -q http://mirrors.ctan.org/fonts/ebgaramond.zip && sudo unzip -q ebgaramond.zip
RUN sudo wget -q http://mirrors.ctan.org/fonts/lato.zip && sudo unzip -q lato.zip
RUN sudo wget -q http://mirrors.ctan.org/fonts/sourcecodepro.zip && sudo unzip -q sourcecodepro.zip

# install the fonts
RUN cp ebgaramond/opentype/*.otf -r /usr/local/share/fonts
RUN cp lato/truetype/*.ttf -r /usr/local/share/fonts
RUN cp sourcecodepro/fonts/*.otf -r /usr/local/share/fonts
RUN sudo fc-cache -f -v

# install and test our package
CMD ["R", "-f", "./stormdown/guidence/cicd.R"]
