FROM alpine:3.4

COPY .bashrc /root/

RUN set -x \
	&& apk add --no-cache bash curl git grep make docker binutils coreutils findutils python py-pip perl ncurses sudo \
	&& pip install docker-compose

ENTRYPOINT ["/bin/bash"]
