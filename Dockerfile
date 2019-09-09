FROM thomasweise/docker-texlive-full

RUN apt-get update \
	&& apt-get install -y \
		biber \
		python3-pip \
		inkscape \ 
    && pip3 install pygments \
	&& apt-get clean \
  	&& apt-get autoclean -y \
  	&& apt-get autoremove -y \
  	&& apt-get clean \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /var/lib/apt/lists/* 
WORKDIR /work