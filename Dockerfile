FROM alpine:3.4

COPY .bashrc /root/

RUN set -x \
	&& apk add --no-cache bash make binutils coreutils findutils grep curl git perl python py-pip ncurses docker sudo \
	&& pip install docker-compose

ENTRYPOINT ["/bin/bash"]

ARG GIT_COMMIT=unknown
ARG GIT_BRANCH=unknown
LABEL git-commit=$GIT_COMMIT git-branch=$GIT_BRANCH
