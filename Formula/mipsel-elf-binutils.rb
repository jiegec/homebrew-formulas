class MipselElfBinutils < Formula
  desc "GNU Binutils targetting mipsel-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.30.tar.xz"
  version "2.30"
  sha256 "6e46b8aeae2f727a36f0bd9505e405768a72218f1796f0d09757d45209871ae6"

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
