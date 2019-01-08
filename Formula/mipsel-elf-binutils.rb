class MipselElfBinutils < Formula
  desc "GNU Binutils targetting mipsel-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.31.1.tar.xz"
  version "2.31.1"
  sha256 "5d20086ecf5752cc7d9134246e9588fa201740d540f7eb84d795b1f7a93bca86"

  def install
    mkdir "binutils-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=mipsel-elf",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror"
      system "make"
      system "make", "install"
    end
  end

  test do
    system "mipsel-elf-as", "--version"
  end
end
