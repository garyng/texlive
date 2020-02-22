FROM garyng/texlive-full
# https://github.com/debuerreotype/debuerreotype/issues/10#issuecomment-439857431
RUN for i in {1..8}; do mkdir -p "/usr/share/man/man$i"; done
RUN apt-get update \
	&& apt-get install -y \
		biber \
		python3-pip \
		inkscape \ 
		default-jre \
    && pip3 install pygments \
	&& apt-get clean \
  	&& apt-get autoclean -y \
  	&& apt-get autoremove -y \
  	&& apt-get clean \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /var/lib/apt/lists/* 

# update to latest svg
# todo: remove this when the update is include in the distro
RUN tlmgr init-usertree \
	&& tlmgr install svg
WORKDIR /work