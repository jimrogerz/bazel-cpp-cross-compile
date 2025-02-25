platform(
    name = "linux_arm_64",
    constraint_values = [
       "@platforms//cpu:arm64",
       "@platforms//os:linux",
    ],
)

platform(
    name = "linux_x86_64",
    constraint_values = [
       "@platforms//cpu:x86_64",
       "@platforms//os:linux",
    ],
)

cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
)
