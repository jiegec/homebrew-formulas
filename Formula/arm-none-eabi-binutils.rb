class ArmNoneEabiBinutils < Formula
  desc "GNU Binutils targetting mipsel-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "https://sourceware.org/pub/binutils/releases/binutils-2.38.tar.xz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.38.tar.xz"
  version "2.38"
  sha256 "e316477a914f567eccc34d5d29785b8b0f5a10208d36bbacedcc39048ecfe024"

  def install
    mkdir "binutils-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--infodir=#{info}",
                             "--mandir=#{man}",
                             "--target=arm-none-eabi",
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
    system "arm-none-eabi-as", "--version"
  end
end
