class Riscv64UnknownElf < Formula
  desc "Bare-metal RISCV64 ELF toolchain and cross-compiler for OS X"
  homepage "https://www.sifive.com/boards"
  url "https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2020.04.0-x86_64-apple-darwin.tar.gz"
  version "8.3.0-2020.04.0"
  sha256 "f7b5d1ff92b1fe0db90295ba02e8f684c5d8fc3c26d01cef6b376668053fc038"

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end

