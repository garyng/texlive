FROM thomasweise/docker-texlive-full

RUN apt-get update && apt-get install -y \
		biber
        
WORKDIR /work
CMD [ "sleep", "infinity" ]