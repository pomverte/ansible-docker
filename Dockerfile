FROM python:3.8-alpine3.12

RUN apk --no-cache update && \
    apk add --no-cache       \
    bash                     \
    ca-certificates          \
    gcc                      \
    libffi-dev               \
    linux-headers            \
    musl-dev                 \
    openssh-client           \
    openssl-dev

RUN pip --no-cache-dir install \
    ansible==2.9.12 \
    ansible-lint==4.3.4 \
    # molecule==3.0.8 \
    && rm -rf /var/cache/apk/*

CMD [ "ansible-playbook", "--version" ]
