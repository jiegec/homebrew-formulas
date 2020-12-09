class GuileZlib < Formula
  desc "Bindings for zlib"
  homepage "https://notabug.org/guile-zlib/guile-zlib"
  url "https://notabug.org/guile-zlib/guile-zlib/archive/0.0.1.tar.gz"
  sha256 "f1100be6dd31b02983cf498155bf11155ca833421f99698f29e5694317335fb1"

  depends_on "guile"
  depends_on "zlib"
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
      (use-modules (zlib))
    EOS

    ENV["GUILE_AUTO_COMPILE"] = "0"
    ENV["GUILE_LOAD_PATH"] = HOMEBREW_PREFIX/"share/guile/site/3.0"
    ENV["GUILE_LOAD_COMPILED_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/site-ccache"
    ENV["GUILE_SYSTEM_EXTENSIONS_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/extensions"

    system "guile", test
  end
end
