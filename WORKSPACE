load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Dotnet
rules_dotnet_version = "4e66bc96bbe13f1d4988d6ea971d8501feee1ccb"

http_archive(
    name = "io_bazel_rules_dotnet",
    sha256 = "23a6f0bba667aaa3ece439924cfde61c5cf90efd221106d6fbdbe86bdaa7e23d",
    strip_prefix = "rules_dotnet-{}".format(rules_dotnet_version),
    url = "https://github.com/bazelbuild/rules_dotnet/archive/{}.zip".format(rules_dotnet_version),
)

load("@io_bazel_rules_dotnet//dotnet:deps.bzl", "dotnet_repositories")

dotnet_repositories()

load("@io_bazel_rules_dotnet//dotnet:defs.bzl", "dotnet_register_toolchains", "dotnet_repositories_nugets")

dotnet_register_toolchains()

dotnet_repositories_nugets()

load("//:nuget.bzl", "project_dotnet_repositories_nuget")

project_dotnet_repositories_nuget()

# Proto
http_archive(
    name = "com_google_protobuf",
    # sha256 = "65e020a42bdab44a66664d34421995829e9e79c60e5adaa08282fd14ca552f57",
    strip_prefix = "protobuf-3.15.8",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.15.8.tar.gz"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "rules_proto_grpc",
    sha256 = "7954abbb6898830cd10ac9714fbcacf092299fda00ed2baf781172f545120419",
    strip_prefix = "rules_proto_grpc-3.1.1",
    urls = ["https://github.com/rules-proto-grpc/rules_proto_grpc/archive/3.1.1.tar.gz"],
)

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_repos", "rules_proto_grpc_toolchains")

rules_proto_grpc_toolchains()

rules_proto_grpc_repos()

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@rules_proto_grpc//csharp/nuget:nuget.bzl", "nuget_rules_proto_grpc_packages")

nuget_rules_proto_grpc_packages()
