class Riscv64UnknownElf < Formula
  desc "Bare-metal RISCV64 ELF toolchain and cross-compiler for OS X"
  homepage "https://www.sifive.com/boards"
  url "https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-apple-darwin.tar.gz"
  version "10.2.0-2020.12.8"
  sha256 "d0fc75a76cb2873576bc49f0014011de4dac24cd63ce4c67c985aa37167cf730"

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end

