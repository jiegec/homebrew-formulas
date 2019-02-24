class X8664ElfGcc < Formula
  desc "GNU Compiler Collection targetting x86_64-elf"
  homepage "https://gcc.gnu.org"
  url "http://ftpmirror.gnu.org/gcc/gcc-8.3.0/gcc-8.3.0.tar.xz"
  version "8.3.0"
  sha256 "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"

  depends_on "gmp" => :build
  depends_on "x86_64-elf-binutils"
  depends_on "libmpc"
  depends_on "mpfr" => :build

  def install
    mkdir "gcc-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=x86_64-elf",
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
      # It doesn't look for x86_64-elf-as on $PREFIX/bin. Rather, it looks
      # for as on $PREFIX/$TARGET/bin/ ($PREFIX/x86_64-elf/bin/as).
      binutils = Formula["x86_64-elf-binutils"].prefix
      FileUtils.ln_sf "#{binutils}/x86_64-elf", "#{prefix}/x86_64-elf"
    end

  end

  test do
    system "x86_64-elf-gcc", "--version"
  end
end
