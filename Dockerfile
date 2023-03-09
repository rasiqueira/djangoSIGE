FROM alpine:3.7
ENV PYTHONUNBUFFERED 1
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
MAINTAINER lukasgarcya@hotmail.com
RUN mkdir -p /opt/djangoSIGE/
WORKDIR /opt/djangoSIGE/
COPY requirements.txt /opt/djangoSIGE/
RUN apk add --no-cache python3 python3-dev \
    libffi-dev\
    py3-cffi zlib-dev gcc jpeg-dev \
    linux-headers libressl-dev \
    libxml2-dev libxslt-dev \
    musl-dev postgresql-dev \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh\
    && pip3 install -U setuptools\
    && pip3 install -r requirements.txt \
    && pip3 install gunicorn psycopg2-binary
