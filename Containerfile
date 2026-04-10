FROM registry.access.redhat.com/ubi10/nodejs-22:latest AS git
ARG BRANCH master
RUN git clone --single-branch --depth=1 --branch="${BRANCH}" https://github.com/isptools/probe.git /tmp/src

FROM registry.access.redhat.com/ubi10/nodejs-22:latest AS builder
USER 0
RUN dnf install --setopt=install_weak_deps=False --setopt=tsflags=nodocs --setopt=tsflags=noscripts -y make \
 && dnf clean all
USER default
COPY --from=git --chown=default:root --chmod=0755 /tmp/src /tmp/src
RUN /usr/libexec/s2i/assemble

FROM registry.access.redhat.com/ubi10/nodejs-22-minimal:latest AS runner
COPY --from=builder $HOME $HOME
EXPOSE 8000
CMD /usr/libexec/s2i/run
