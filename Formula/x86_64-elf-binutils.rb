class X8664ElfBinutils < Formula
  desc "GNU Binutils targetting x86_64-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.31.1.tar.xz"
  version "2.31.1"
  sha256 "5d20086ecf5752cc7d9134246e9588fa201740d540f7eb84d795b1f7a93bca86"

  def install
    mkdir "binutils-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=x86_64-elf",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror"
      system "make", "-j2"
      system "make", "install"
    end
  end

  test do
    system "x86_64-elf-as", "--version"
  end
end
