class Riscv64UnknownElf < Formula
  desc "Bare-metal RISCV64 ELF toolchain and cross-compiler for OS X"
  homepage "https://www.sifive.com/boards"
  url "https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.2.0-2019.05.3-x86_64-apple-darwin.tar.gz"
  version "8.2.0-2019.05.3"
  sha256 "027bea47be0af509ea5f7615858f11bb92cf0a9a2a1a5978a92c329592baf73c"

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end

