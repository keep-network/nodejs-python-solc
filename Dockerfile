FROM ethereum/solc:0.5.4 as solc
FROM jfloff/alpine-python:latest

COPY --from=solc /usr/bin/solc /usr/bin/solc

RUN apk --no-cache --update add libpng-dev build-base boost-dev nodejs nodejs-npm && \
  python3 -m venv ~/env && source ~/env/bin/activate && pip3 install solidity-flattener
