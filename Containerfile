FROM registry.access.redhat.com/ubi9/nodejs-22:9.5 AS builder

ARG BRANCH master

RUN git clone --single-branch --depth=1 --branch="${BRANCH}" https://github.com/isptools/probe.git /tmp/src
RUN /usr/libexec/s2i/assemble

FROM registry.access.redhat.com/ubi9/nodejs-22-minimal:9.5 AS runner
COPY --from=builder $HOME $HOME
CMD /usr/libexec/s2i/run
