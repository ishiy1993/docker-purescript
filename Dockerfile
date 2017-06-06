FROM debian:jessie as builder

RUN apt update && apt install -y curl git \
    && curl -sSL https://get.haskellstack.org/ | sh \
    && git clone https://github.com/purescript/psc-package.git \
    && cd psc-package \
    && stack setup && stack install --local-bin-path .

FROM node:8

WORKDIR /tmp
RUN wget "https://github.com/purescript/purescript/releases/download/v0.11.5/linux64.tar.gz" \
    && tar xvfz linux64.tar.gz \
    && cp purescript/psc* purescript/purs /usr/local/bin/ \
    && cd .. \
    && rm -r /tmp \
    && npm install -g bower pulp

COPY --from=builder /psc-package/psc-package /usr/local/bin/

WORKDIR /work
CMD ["bash"]
