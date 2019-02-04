FROM ubuntu:18.04

RUN apt update	&& \
	apt-get install -y  build-essential && \
	apt-get install -y texinfo bison  gawk tree vim git wget && \
	rm  /bin/sh  && \
	ln -s /bin/bash /bin/sh

CMD ["/bin/bash"]
