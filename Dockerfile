FROM thomasweise/docker-texlive-full

RUN apt-get update \
	&& apt-get install -y \
		biber \
		python3-pip \
    && pip3 install pygments
WORKDIR /work
CMD [ "sleep", "infinity" ]