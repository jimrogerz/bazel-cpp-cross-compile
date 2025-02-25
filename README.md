# Bazel setup for C++ x86_64 and arm64 compilation

Here's a bare-bones C++ cross-compilation project based on https://bazel.build/tutorials/ccp-toolchain-config.

## Prerequisites

Tested on Ubuntu with bazel 8.1.0. You'll need the gcc arm compiler and probably other stuff:

```bash
sudo apt install gcc-arm-linux-gnueabi
```

Have a look in the toolchain directory - there's some system specific paths you might need to update.

## Linux x86_64 build

```bash
bazel build //main:hello-world --platforms=//main:linux_x86_64
```

## Linux arm64 build

```bash
bazel build //main:hello-world --platforms=//main:linux_arm_64
```
