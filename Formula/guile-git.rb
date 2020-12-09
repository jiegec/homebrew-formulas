class GuileGit < Formula
  desc "Guile-Git is a GNU Guile library providing bindings to libgit2."
  homepage "https://gitlab.com/guile-git/guile-git/"
  url "https://gitlab.com/guile-git/guile-git/-/archive/v0.4.0/guile-git-v0.4.0.tar.gz"
  sha256 "da41cfef6ae1d83c4a716cae7d1618a1b581921d1c0197ec04fb6851203422f1"

  depends_on "guile"
  depends_on "libgit2"
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
      (use-modules (git))
    EOS

    ENV["GUILE_AUTO_COMPILE"] = "0"
    ENV["GUILE_LOAD_PATH"] = HOMEBREW_PREFIX/"share/guile/site/3.0"
    ENV["GUILE_LOAD_COMPILED_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/site-ccache"
    ENV["GUILE_SYSTEM_EXTENSIONS_PATH"] = HOMEBREW_PREFIX/"lib/guile/3.0/extensions"

    system "guile", test
  end
end
