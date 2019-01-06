class Riscv64UnknownElf < Formula
  # Thanks Sergio Benitez for aarch64-none-elf prebuilt binaries and the Homebrew recipe
  desc "Bare-metal RISCV64 ELF toolchain and cross-compiler for OS X"
  homepage "https://www.sifive.com/boards"
  url "https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.1.0-2018.12.0-x86_64-apple-darwin.tar.gz"
  version "8.1.0-2018.12.0"
  sha256 "50b9781f3b9920812f867dfb2f35a59b843290a6e190e78a84b00db84bfc3935"

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end

