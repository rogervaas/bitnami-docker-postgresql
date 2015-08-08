FROM bitnami/base-ubuntu:14.04-onbuild
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_DIR=$BITNAMI_PREFIX/postgresql \
    BITNAMI_APP_NAME=postgresql \
    BITNAMI_APP_USER=postgres \
    BITNAMI_APP_VERSION=9.4.4-1

ENV BITNAMI_APP_VOL_PREFIX=/bitnami/$BITNAMI_APP_NAME \
    PATH=$BITNAMI_APP_DIR/bin:$PATH

RUN sh $BITNAMI_PREFIX/install.sh\
    --postgres_password bitnami

COPY bitnami-utils-custom.sh /bitnami-utils-custom.sh
EXPOSE 5432
VOLUME ["$BITNAMI_APP_VOL_PREFIX/data"]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["postgres"]