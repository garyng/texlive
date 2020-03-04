FROM garyng/texlive-full
# https://stackoverflow.com/a/58503437/1023180
RUN mkdir -p /usr/share/man/man1/
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

# 2.02e does not work
ADD https://github.com/mrpiggi/svg/releases/download/v2.02d/svg_v2.02d.zip /tmp
# manually install package
# https://tex.stackexchange.com/questions/73016/how-do-i-install-an-individual-package-on-a-linux-system
# https://tex.stackexchange.com/questions/7588/install-downloaded-package-via-tlmgr
RUN cd /tmp \
	&& unzip -d `kpsewhich --var-value TEXMFLOCAL` svg_v2.02d.zip \
	&& mktexlsr \
	&& rm svg_v2.02d.zip

WORKDIR /work