class MipselElfGcc < Formula
  desc "GNU Compiler Collection targetting mipsel-elf"
  homepage "https://gcc.gnu.org"
  url "http://ftpmirror.gnu.org/gcc/gcc-7.3.0/gcc-7.3.0.tar.xz"
  version "7.3.0"
  sha256 "832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c"

  depends_on "gmp" => :build
  depends_on "mipsel-elf-binutils"
  depends_on "libmpc"
  depends_on "mpfr" => :build

  def install
    mkdir "gcc-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=mipsel-elf",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror",
                             "--without-headers",
                             "--without-isl",
                             "--enable-languages=c,c++"

      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"

      # GCC needs this folder in #{prefix} in order to see the binutils.
      # It doesn't look for mipsel-elf-as on $PREFIX/bin. Rather, it looks
      # for as on $PREFIX/$TARGET/bin/ ($PREFIX/mipsel-elf/bin/as).
      binutils = Formula["mipsel-elf-binutils"].prefix
      FileUtils.ln_sf "#{binutils}/mipsel-elf", "#{prefix}/mipsel-elf"
    end

  end

  test do
    system "mipsel-elf-gcc", "--version"
  end
end
