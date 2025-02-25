# Bazel setup for C++ x86_64 and arm64 compilation

Here's a hello world project that compiles for x86_64 or arm64. Why was this so hard? 😰

## Prerequisites

You'll at least need the gcc arm compiler:

```bash
sudo apt install gcc-arm-linux-gnueabi
```

## Linux x86_64 build

```bash
bazel build //main:hello-world --platforms=//main:linux_x86_64
```

## Linux arm64 build

```bash
bazel build //main:hello-world --platforms=//main:linux_arm_64
```
