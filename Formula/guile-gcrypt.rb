class GuileGcrypt < Formula
  desc "Guile bindings for libgcrypt"
  homepage "https://notabug.org/cwebber/guile-gcrypt"
  url "https://notabug.org/cwebber/guile-gcrypt/archive/v0.3.0.tar.gz"
  sha256 "07394c3de4f31a36ca2b670e1998c526de891d9436f12e94d8862ab081274d6a"

  depends_on "guile"
  depends_on "libgcrypt"
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    ENV["GUILE_LOAD_PATH"] = HOMEBREW_PREFIX/"share/guile/site/3.0"
    ENV["GUILE_LOAD_COMPILED_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/site-ccache"
    ENV["GUILE_SYSTEM_EXTENSIONS_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/extensions"

    system "autoreconf", "-fiv"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--with-libgcrypt-libdir=#{HOMEBREW_PREFIX}/opt/libgcrypt/lib",
                          "--prefix=#{prefix}"
    system "make", "install" 
  end

  test do
    test = testpath/"test.scm"
    test.write <<~EOS
      (use-modules (gcrypt hash))
    EOS

    ENV["GUILE_AUTO_COMPILE"] = "0"
    ENV["GUILE_LOAD_PATH"] = HOMEBREW_PREFIX/"share/guile/site/3.0"
    ENV["GUILE_LOAD_COMPILED_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/site-ccache"
    ENV["GUILE_SYSTEM_EXTENSIONS_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/extensions"

    system "guile", test
  end
end
