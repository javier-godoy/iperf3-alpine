FROM alpine:3.13 AS build

#git + OpenSSH
RUN apk --no-cache add git openssh

#Shared C build chain
RUN apk --no-cache add autoconf make automake gcc libc-dev

RUN git clone https://github.com/esnet/iperf.git

RUN cd /iperf && \
	./configure --enable-static-bin &&\
	make --jobs=2 && make install

FROM alpine:3.13
COPY --from=build /usr/local/bin/iperf3 /usr/bin/iperf3

CMD echo