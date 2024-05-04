{ btop, buildOpts, ... }:
(btop.override {
  inherit (buildOpts) stdenv;

}).overrideAttrs (_oldAttrs: {
  inherit (buildOpts) CFLAGS CXXFLAGS LDFLAGS buildInputs nativeBuildInputs;
  src = ../.;
})
