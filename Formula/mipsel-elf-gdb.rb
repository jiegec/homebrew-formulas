class MipselElfGdb < Formula
  desc "GNU Project Debugger targetting mipsel-elf"
  homepage "https://www.gnu.org/software/gdb/"
  url "https://ftp.gnu.org/gnu/gdb/gdb-8.1.tar.xz"
  version "8.1"
  sha256 "af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583e8143b5426be4b34"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=mipsel-elf",
                          "--program-prefix=mipsel-elf-",
                          "--disable-werror"

    system "make"
    system "make", "install"

    # Conflict with mipsel-elf-binutils
    FileUtils.rm_rf "#{prefix}/share/info"
    FileUtils.rm_rf "#{prefix}/share/locale"
  end

  test do
    system "mipsel-elf-gdb", "--version"
  end
end
