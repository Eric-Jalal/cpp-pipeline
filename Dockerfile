FROM gcc:9.5.0 as builder

ARG GIT_COMMIT=unspecified
LABEL build.org.mybigcompany=$GIT_COMMIT

WORKDIR /usr/src/app

COPY . .

RUN apt-get update && apt-get install -y cmake

RUN cmake . && make

FROM debian:buster-slim

COPY --from=builder /usr/src/app/main /usr/app/main

WORKDIR /usr/app

CMD ["./main"]
