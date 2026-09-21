ARG ALPINE_TAG
FROM alpine:${ALPINE_TAG} AS build

#git + OpenSSH
RUN apk --no-cache add git openssh

#Shared C build chain
RUN apk --no-cache add autoconf make automake gcc libc-dev

RUN git clone https://github.com/esnet/iperf.git

RUN cd /iperf && \
	./configure --enable-static-bin &&\
	make --jobs=$(nproc) && make install

FROM alpine:${ALPINE_TAG}
COPY --from=build /usr/local/bin/iperf3 /usr/bin/iperf3

CMD echo