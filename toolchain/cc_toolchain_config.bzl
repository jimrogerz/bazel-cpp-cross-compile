load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = ctx.attr.compiler_prefix + "gcc",
        ),
        tool_path(
            name = "ld",
            path = ctx.attr.compiler_prefix + "ld",
        ),
        tool_path(
            name = "ar",
            path = ctx.attr.compiler_prefix + "ar",
        ),
        tool_path(
            name = "cpp",
            path = ctx.attr.compiler_prefix + "false",
        ),
        tool_path(
            name = "gcov",
            path = ctx.attr.compiler_prefix + "false",
        ),
        tool_path(
            name = "nm",
            path = ctx.attr.compiler_prefix + "false",
        ),
        tool_path(
            name = "objdump",
            path = ctx.attr.compiler_prefix + "false",
        ),
        tool_path(
            name = "strip",
            path = ctx.attr.compiler_prefix + "false",
        ),
    ]

    features = [
        feature(
            name = "default_linker_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = all_link_actions,
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "-lstdc++",
                            ],
                        ),
                    ]),
                ),
            ],
        ),
    ]

    if ctx.attr.target_cpu == "x86_64":
        include_directories = [
            "/usr/include",
            "/usr/lib",
        ]
    elif ctx.attr.target_cpu == "arm64":
        include_directories = [
            "/usr/lib/gcc-cross/arm-linux-gnueabihf/14/include",
            "/usr/arm-linux-gnueabihf/include",
        ]
    else:
        fail("Unsupported architecture")

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        cxx_builtin_include_directories = include_directories,
        toolchain_identifier = ctx.attr.target_cpu + "-toolchain",
        host_system_name = "local",
        target_system_name = "local",
        target_cpu = ctx.attr.target_cpu,
        target_libc = "unknown",
        compiler = "gcc",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "target_cpu": attr.string(mandatory = True),
        "compiler_prefix": attr.string(mandatory = True),
    },
    provides = [CcToolchainConfigInfo],
)
