#!/bin/bash

rm -rf lib vendor function.zip
mkdir lib vendor
docker build -t your_lamba_name -f Dockerfile .                                && \
CONTAINER=$(docker run -d your_lamba_name false)                               && \

docker cp $CONTAINER:/var/task/vendor/ ./                                      && \
docker cp $CONTAINER:/usr/lib64/libpq.so.5.5 lib/libpq.so.5                    && \
docker cp $CONTAINER:/usr/lib64/libldap-2.4.so.2.10.7 lib/libldap_r-2.4.so.2   && \
docker cp $CONTAINER:/usr/lib64/liblber-2.4.so.2.10.7 lib/liblber-2.4.so.2     && \
docker cp $CONTAINER:/usr/lib64/libsasl2.so.3.0.0     lib/libsasl2.so.3        && \
docker cp $CONTAINER:/usr/lib64/libssl3.so            lib/libssl3.so           && \
docker cp $CONTAINER:/usr/lib64/libsmime3.so          lib/libsmime3.so         && \
docker cp $CONTAINER:/usr/lib64/libnss3.so            lib/libnss3.so           && \
docker stop $CONTAINER                                                         && \

zip -r function.zip . && \
aws lambda update-function-code --function-name your_lamba_name --zip-file fileb://function.zip
