FROM python:3.13-alpine

# RUN adduser -D -g "Wagtail User" wagtail

WORKDIR /

ADD ./conf/requirements.txt /conf/requirements.txt

# RUN apk add --no-cache --virtual .build-deps gcc musl-dev icu-data-full postgresql-dev postgresql17-client libffi-dev uv \
RUN apk add --no-cache uv postgresql17-client \
    && apk add --no-cache --virtual .build-deps gcc musl-dev icu-data-full postgresql-dev libffi-dev \
    && uv pip install --system -r /conf/requirements.txt \
    && uv clean \
    && apk del .build-deps

# USER wagtail
EXPOSE 8000
