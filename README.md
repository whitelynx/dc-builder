dc-builder
==========

A slim Docker image for building projects which use Docker.

This image is based on [the official `alpine` image](https://hub.docker.com/_/alpine/).


What's included
---------------

Standard development tools:
- `bash`
- `make`
- `binutils`
- `coreutils`
- `findutils`
- `grep`
- `curl`
- `git`
- `perl`
- `python`
- `py-pip` _(used to install `docker-compose`)_
- `sudo` _(I know, this really isn't necessary in a Docker image, but some build processes do use it)_

Docker tools:
- `docker`
- `docker-compose`

This repository also includes a handy [`dc-builder`](./dc-builder) script, to simplify starting a container using this
image.


How to use
----------

This image is meant to be used with your desired working directory mounted as a volume at _the same place_ in the
container as it is on the host system. (e.g., if you want to work on a project in `/home/myuser/myproject`, that
directory should be mounted at `/home/myuser/myproject` in the container) This helps to avoid surprising behavior when
mounting volumes using `docker run`, or when using `docker-compose`, since the paths will line up with the host system.

If you _don't_ mount your working directory at the same place, then _any host path you pass to the `-v` option of
`docker run`, and any path you specify in a `docker-compose` configuration file MUST be a path from the host system_,
or Docker won't be able to find your source path. (basically, the paths inside the `dc-builder` container don't matter
at all, from Docker's perspective)


### Without using the `dc-builder` script:

```bash
docker pull whitelynx/dc-builder:latest
docker run -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD":"$PWD" -w "$PWD" -e TERM="$TERM" --rm -it dc-builder:latest -i
```

You may replace the `-i` with any arguments you want passed to `bash`.


### Using the `dc-builder` script:

```bash
git clone https://github.com/whitelynx/dc-builder.git
cd ~/some/other/project\'s/directory
~/path/to/dc-builder  # This will mount the current working directory as a volume
                      # in the container, and set it as the working directory.
```

You may wish to copy/symlink the `dc-builder` script somewhere in your `PATH` (usually, `/usr/local/bin` would be a
good choice) so you can run it from anywhere; then, the above becomes even simpler:

```bash
cd ~/some/other/project\'s/directory
dc-builder
```
