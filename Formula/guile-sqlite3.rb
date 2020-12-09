class GuileSqlite3 < Formula
  desc "Guile bindings to SQLite."
  homepage "https://notabug.org/guile-sqlite3/guile-sqlite3"
  url "https://notabug.org/guile-sqlite3/guile-sqlite3/archive/v0.1.3.tar.gz"
  sha256 "158cb82958c6329319f911412999ea125980f327f54185bf0dad271d6f8f45c2"

  depends_on "guile"
  depends_on "sqlite3"
  depends_on "scheme-bytestructures"
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
    system "make", "check"
    system "make", "install"
  end

  test do
    test = testpath/"test.scm"
    test.write <<~EOS
      (use-modules (sqlite3))
    EOS

    ENV["GUILE_AUTO_COMPILE"] = "0"
    ENV["GUILE_LOAD_PATH"] = HOMEBREW_PREFIX/"share/guile/site/3.0"
    ENV["GUILE_LOAD_COMPILED_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/site-ccache"
    ENV["GUILE_SYSTEM_EXTENSIONS_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/extensions"

    system "guile", test
  end
end
