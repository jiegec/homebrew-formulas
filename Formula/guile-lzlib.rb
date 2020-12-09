class GuileLzlib < Formula
  desc "Bindings for lzlib"
  homepage "https://notabug.org/guile-lzlib/guile-lzlib"
  url "https://notabug.org/guile-lzlib/guile-lzlib/archive/0.0.2.tar.gz"
  sha256 "8623db77d447e7b9ffbfcbc288390e706a6b1a89b1171daed60874cfec7e4f87"

  depends_on "guile"
  depends_on "lzlib"
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    ENV["GUILE_LOAD_PATH"] = HOMEBREW_PREFIX/"share/guile/site/3.0"
    ENV["GUILE_LOAD_COMPILED_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/site-ccache"
    ENV["GUILE_SYSTEM_EXTENSIONS_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/extensions"

    system "autoreconf", "-fiv"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    test = testpath/"test.scm"
    test.write <<~EOS
      (use-modules (lzlib))
    EOS

    ENV["GUILE_AUTO_COMPILE"] = "0"
    ENV["GUILE_LOAD_PATH"] = HOMEBREW_PREFIX/"share/guile/site/3.0"
    ENV["GUILE_LOAD_COMPILED_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/site-ccache"
    ENV["GUILE_SYSTEM_EXTENSIONS_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/extensions"

    system "guile", test
  end
end
