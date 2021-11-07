FROM golang:1.16-alpine as build-stage
WORKDIR /usr/src/app
COPY  . .
RUN  CGO_ENABLED=0  go build


FROM scratch
WORKDIR /usr/src/app
COPY --from=build-stage  /usr/src/app/server /usr/src/app
ENTRYPOINT ["./server"]