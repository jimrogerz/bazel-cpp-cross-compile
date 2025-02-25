package(default_visibility = ["//visibility:public"])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

filegroup(name = "empty")

cc_toolchain_config(
    name = "linux_x86_64_toolchain_config",
    target_cpu = "x86_64",
    compiler_prefix = "/usr/bin/",
)

cc_toolchain(
    name = "linux_x86_64_toolchain",
    toolchain_identifier = "linux_x86_64-toolchain",
    toolchain_config = ":linux_x86_64_toolchain_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)

toolchain(
    name = "cc_toolchain_for_linux_x86_64",
    toolchain = ":linux_x86_64_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
)

cc_toolchain_config(
    name = "linux_arm_64_toolchain_config",
    target_cpu = "arm64",
    compiler_prefix = "/usr/bin/arm-linux-gnueabihf-", # Or the correct prefix for your ARM tools
)

cc_toolchain(
    name = "linux_arm_64_toolchain",
    toolchain_identifier = "linux_arm_64-toolchain",
    toolchain_config = ":linux_arm_64_toolchain_config",
    all_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)

toolchain(
    name = "cc_toolchain_for_linux_arm_64",
    toolchain = ":linux_arm_64_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    exec_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    target_compatible_with = [
        "@platforms//cpu:arm64",
        "@platforms//os:linux",
    ],
)
