FROM gcc:9.5.0

ARG GIT_COMMIT=unspecified
LABEL org.mybigcompany=$GIT_COMMIT

WORKDIR /usr/src/app

COPY . .

RUN apt-get update && apt-get install -y cmake lcov

RUN cmake . && make

CMD ["./main"]

