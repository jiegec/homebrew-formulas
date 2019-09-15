class MipselLinuxMusl < Formula
  desc "Mac-to-Linux Cross-Compiler Toolchains"
  homepage "https://mac.musl.cc/"
  url "https://lisa.musl.cc/9.2.1/mipsel-linux-musl-cross.tgz"
  version "9.2.1"
  sha256 "71e44134fab38898e3a2139e482d361b1f1be7047255b6602459fad9d83cd744"

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end

