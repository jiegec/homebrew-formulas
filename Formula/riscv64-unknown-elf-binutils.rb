class Riscv64UnknownElfBinutils < Formula
  desc "GNU Binutils targetting riscv64-unknown-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.37.tar.xz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.37.tar.gz"
  version "2.37"
  sha256 "820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c"

  def install
    mkdir "binutils-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--infodir=#{info}",
                             "--mandir=#{man}",
                             "--target=riscv64-unknown-elf",
                             "--enable-deterministic-archives",
                             "--disable-debug",
                             "--disable-dependency-tracking",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror"
      system "make"
      system "make", "install"
    end

    info.rmtree
    man1.rmtree
  end

  test do
    system "riscv64-unknown-elf-as", "--version"
  end
end
