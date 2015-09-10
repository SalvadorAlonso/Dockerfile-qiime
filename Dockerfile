############################################################
# Dockerfile to build QIIME and IPython container images 
# Based on Ubuntu
############################################################
FROM ubuntu:14.04
#AUTHOR: Salvador Alonso
RUN apt-get update
RUN apt-get -y upgrade
##############PREPARE YOUR BUILD ENVIRONMENT################
RUN apt-get install -y build-essential python-dev python-pip
################## BEGIN INSTALLATION ######################
RUN apt-get install -y python-numpy
RUN apt-get install -y ipython-notebook
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y liblapacke-dev libblas-dev liblapack-dev
RUN apt-get install -y gfortran
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN ln -s /usr/include/freetype2/ft2build.h /usr/include/
RUN pip install qiime
#############TESTING THE QIIME BASE INSTALLATION############
RUN print_qiime_config.py -t
##################### AUTOMATIC COMMAND ####################
ADD start-ipython /
ENTRYPOINT ["/start-ipython"]
CMD []
##################### INSTALLATION END #####################

EXPOSE 8888
