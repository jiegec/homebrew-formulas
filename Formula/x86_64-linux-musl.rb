class X8664LinuxMusl < Formula
  desc "Mac-to-Linux Cross-Compiler Toolchains"
  homepage "https://mac.musl.cc/"
  url "https://lisa.musl.cc/9.2.1/x86_64-linux-musl-cross.tgz"
  version "9.2.1"
  sha256 "b7e1a278216e0c97d4ebe59cc3eaf700b119c62f6a38d59fbc37080ae5ffbf70"

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end

