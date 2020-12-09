class GuileJson < Formula
  desc "guile-json is a JSON module for Guile"
  homepage "https://github.com/aconchillo/guile-json"
  url "https://github.com/aconchillo/guile-json/archive/4.4.1.tar.gz"
  sha256 "b1e8bb6d1c90bdda68c954c6aba00969bb61ed117b9d9a07333cd15d12d2b2ad"

  depends_on "guile"
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
    system "make", "install" 
  end

  test do
    test = testpath/"test.scm"
    test.write <<~EOS
      (use-modules (json))
    EOS

    ENV["GUILE_AUTO_COMPILE"] = "0"
    ENV["GUILE_LOAD_PATH"] = HOMEBREW_PREFIX/"share/guile/site/3.0"
    ENV["GUILE_LOAD_COMPILED_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/site-ccache"
    ENV["GUILE_SYSTEM_EXTENSIONS_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/extensions"

    system "guile", test
  end
end
