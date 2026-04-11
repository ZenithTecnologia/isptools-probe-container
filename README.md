# Enterprise-ready container for ISPTools probe

## Status

[![[CI] Upstream Main](https://github.com/ZenithTecnologia/isptools-probe-container/actions/workflows/container-build-branch-main.yml/badge.svg)](https://github.com/ZenithTecnologia/isptools-probe-container/actions/workflows/container-build-branch-main.yml)

## What is?

This repository is https://github.com/isptools/probe compiled with RedHat UBI images in a weekly manner to keep security fixes up.

## How to use?

### Quadlet way (Prefered):

Install your distro podman package and copy file `isp-tools-probe.container` to `/etc/containers/systemd` folder and run:

```bash
systemctl daemon-reload
systemctl start isp-tools-probe
systemctl enable podman-auto-update.timer
```

This Quadlet register itself on systemd boot process.

### Vanilla way:

Replace `isptools/probe` container image from [ISP.tools instructions](http://www.isp.tools/instrucoes) with image `ghcr.io/zenithtecnologia/isptools-probe-container:latest`.

## Notes

V2.0 branch are also available with tag `ghcr.io/zenithtecnologia/isptools-probe-container:v2.0`
