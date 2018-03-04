FROM node:9

WORKDIR /tmp
RUN wget "https://github.com/purescript/purescript/releases/download/v0.11.7/linux64.tar.gz" -O purescript.tar.gz \
    && tar xvfz purescript.tar.gz \
    && cp purescript/psc* purescript/purs /usr/local/bin/ \
    && wget "https://github.com/purescript/psc-package/releases/download/v0.3.1/linux64.tar.gz" -O psc-package.tar.gz \
    && tar xvfz psc-package.tar.gz \
    && cp psc-package/psc-package /usr/local/bin \
    && cd .. \
    && rm -r /tmp \
    && npm install -g bower pulp

WORKDIR /work
CMD ["bash"]
