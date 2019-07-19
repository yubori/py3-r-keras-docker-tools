#FROM tensorflow/tensorflow:latest-gpu-py3
#FROM tensorflow/tensorflow:1.13.1-gpu-py3 
FROM tensorflow/tensorflow:1.14.0-gpu-py3 

ENV DEBIAN_FRONTEND=noninteractive

RUN pip3 install --upgrade pip keras scikit-image sklearn deap pydot
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
&& . /etc/lsb-release \
&& add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $DISTRIB_CODENAME-cran35/" \
&& apt-get update \
&& apt-get -y install r-base r-base-dev graphviz\
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
RUN echo "install.packages(c('RcppRoll', 'foreach' , 'bigmemory' , 'biganalytics' , 'keras', 'cluster'), clean=T, repos='https://cran.ism.ac.jp/')" | R --no-save 

#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
