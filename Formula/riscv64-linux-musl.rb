class Riscv64LinuxMusl < Formula
  desc "Mac-to-Linux Cross-Compiler Toolchains"
  homepage "https://mac.musl.cc/"
  url "https://lisa.musl.cc/9.2.1/riscv64-linux-musl-cross.tgz"
  version "9.2.1"
  sha256 "29f999ab69cdcb357a5d1761294d8b12138172ab07d7cb696aa0aa90c155fcfd"

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end

