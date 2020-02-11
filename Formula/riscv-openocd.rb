class RiscvOpenocd < Formula
  desc "On-chip debugging, in-system programming and boundary-scan testing"
  homepage "http://openocd.org/"

  head do
    url "https://github.com/riscv/riscv-openocd.git", :branch => "riscv"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "texinfo" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "hidapi"
  depends_on "libftdi"
  depends_on "libusb"
  depends_on "libusb-compat"

  def install
    ENV["CCACHE"] = "none"

    system "./bootstrap", "nosubmodule" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--program-prefix=riscv-",
                          "--prefix=#{prefix}",
                          "--enable-buspirate",
                          "--enable-stlink",
                          "--enable-dummy",
                          "--enable-jtag_vpi",
                          "--enable-remote-bitbang"
    system "make", "pkgdatadir=#{prefix}/share/riscv-openocd", "install"
    system "rm", "-r", "#{prefix}/share/info"
  end
end
