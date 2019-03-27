class Riscv64ElfBinutils < Formula
  desc "GNU Binutils targetting riscv64-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.32.tar.xz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.32.tar.gz"
  version "2.32"
  sha256 "0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04"

  def install
    mkdir "binutils-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--infodir=#{info}",
                             "--mandir=#{man}",
                             "--target=riscv64-elf",
                             "--enable-deterministic-archives",
                             "--disable-debug",
                             "--disable-dependency-tracking",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror"
      system "make"
      system "make", "install"
    end
  end

  test do
    system "riscv64-elf-as", "--version"
  end
end
