FROM itsziget/docker-gen-env:1.0.0

ENV TEMPLATE="docron" \
    TARGET="/etc/crontabs/root" \
    DOCRON_LABEL_PREFIX="itsziget.docron-gen" \
    PARAMS="-include-stopped"

COPY docron.tmpl /etc/docker-gen/templates/docron.tmpl
COPY docron-gen-notify.sh /
RUN mv /notify.sh /notify-orig.sh \
 && mv /docron-gen-notify.sh /notify.sh \
 && chmod +x /notify.sh
