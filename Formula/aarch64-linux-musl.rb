class Aarch64LinuxMusl < Formula
  desc "Mac-to-Linux Cross-Compiler Toolchains"
  homepage "https://mac.musl.cc/"
  url "https://lisa.musl.cc/9.2.1/aarch64-linux-musl-cross.tgz"
  version "9.2.1"
  sha256 "01466ce60e69189071bfaf4d791505245ed818e7b6cd9d986d07f45ef297c9f6"

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end

