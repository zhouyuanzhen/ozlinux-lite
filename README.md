# ozlinux-lite
A PoC lite version of Linux

[![OZLinux Lite CI](https://github.com/zhouyuanzhen/ozlinux-lite/actions/workflows/makefile.yml/badge.svg)](https://github.com/zhouyuanzhen/ozlinux-lite/actions/workflows/makefile.yml)

## Quick Start with macOS

![demo](./demo.gif)

```shell
wget -c https://github.com/zhouyuanzhen/ozlinux-lite/releases/download/latest/ahyve
wget -c https://github.com/zhouyuanzhen/ozlinux-lite/releases/download/latest/ozinitrd.gz
wget -c https://github.com/zhouyuanzhen/ozlinux-lite/releases/download/latest/vmlinuz

chmod 755 ahyve

make run
```

To shutdown the lite ozlinux VM, run:

```shell
poweroff -f
```
