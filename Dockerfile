FROM python:3.6-slim

MAINTAINER  Ryan Blunden <ryan.blunden@gmail.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get upgrade -y  && \
    apt-get install -y --no-install-recommends patch && \
    \
    apt-get clean && \
    apt-get purge && \
    \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

RUN pip install pip --upgrade && pip install mkdocs

# Remove the host:port config in the JS live reload.
COPY livereload-server.py.patch /tmp/livereload-server.py.patch
RUN SITE_PACKAGES_DIR=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"` && \
    patch ${SITE_PACKAGES_DIR}/livereload/server.py /tmp/livereload-server.py.patch

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/mkdocs"]

CMD ["serve", "--dev-addr=0.0.0.0:8080"]
