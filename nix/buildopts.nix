{ lib, pkgs, system, ... }:

({ lld_18, ninja, llvmPackages_18, ... }@pkgs:

  let
    # TODO: 
    #   - STRIP
    #   - relax FORTIFY_SOURCE
    #
    CFLAGS =
      lib.optionalString ("${system}" == "aarch64-darwin") "-mcpu=apple-m1 ";
    CXXFLAGS = "${CFLAGS}";
    LDFLAGS = "-fuse-ld=lld";

  in ({ stdenv, libcxx, bintools, ... }@llvmPackages_18: {
    inherit stdenv CFLAGS CXXFLAGS LDFLAGS;
    buildInputs = [ libcxx bintools ];
    nativeBuildInputs = [ ninja ];

  }) llvmPackages_18

) pkgs
