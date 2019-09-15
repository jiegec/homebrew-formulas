class MipselElfGcc < Formula
  desc "GNU Compiler Collection targetting mipsel-elf"
  homepage "https://gcc.gnu.org"
  url "http://ftpmirror.gnu.org/gcc/gcc-8.3.0/gcc-8.3.0.tar.xz"
  version "8.3.0"
  sha256 "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"

  depends_on "gmp" => :build
  depends_on "mipsel-elf-binutils"
  depends_on "libmpc"
  depends_on "gnu-sed"
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
                             "--with-as=#{Formula["mipsel-elf-binutils"].bin}/mipsel-elf-as",
                             "--with-ld=#{Formula["mipsel-elf-binutils"].bin}/mipsel-elf-ld",
                             "--enable-languages=c,c++"

      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"
    end

  end

  test do
    system "mipsel-elf-gcc", "--version"
  end
end
