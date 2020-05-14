FROM golang:1.13.2-alpine3.10 AS build-env
RUN apk add make && apk add --no-cache \
&& rm -rf /var/cache/apk/* \
&& rm -rf /tmp/* 
ENV GOPKG  $GOPATH/src/gitlab.adroady.com/andrian/monitorenpoint
ENV GO111MODULE on 
WORKDIR $GOPKG
COPY . $GOPKG 
RUN  make docker


# final stage
FROM alpine
WORKDIR /app
RUN mkdir /etc/monitorendpoint
COPY --from=build-env /go/src/gitlab.adroady.com/andrian/monitorenpoint /app
COPY --from=build-env /go/src/gitlab.adroady.com/andrian/monitorenpoint/config.toml  /etc/monitorendpoint
COPY --from=build-env /go/src/gitlab.adroady.com/andrian/monitorenpoint/nameapp.conf  /etc/monitorendpoint
ENTRYPOINT ./main
