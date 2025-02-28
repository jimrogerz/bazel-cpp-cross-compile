# Bazel setup for C++ x86_64 and arm64 compilation

Here's a bare-bones C++ cross-compilation project based on https://bazel.build/tutorials/ccp-toolchain-config.

## Prerequisites

Tested on Kubuntu 24.10 with bazel 8.1.0. You'll need the gcc arm compiler:

```bash
sudo apt install gcc-arm-linux-gnueabi
```

Also have a look in `toolchain/cc_toolchain_config.bzl` - there's some system specific paths you might need to update.

## Building

### Linux x86_64

```bash
bazel build //main:hello-world --platforms=//main:linux_x86_64
```

### Linux arm64

```bash
bazel build //main:hello-world --platforms=//main:linux_arm_64
```

## Troubleshooting

Here's some problems I've had using these toolchains in a real project.

### cannot execute: required file not found

When trying to execute the compiled binary on the target machine, I got this error because the machine did not have a required dynamic link library. Fixed by adding `-static` to the default linker flags.

### arm-linux-gnueabihf-gcc: error: unrecognized command-line option '-maes'

This compiler flag should not be used with ARM processors. The problem was in the build configuration of the Abseil library. Fixed by updating to 20250127.0.
